Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id E9A6C6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 11:36:03 +0000 (UTC)
Received: by ioc74 with SMTP id 74so123403817ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=m87E62SBbbUqZVFIL4hkASrfNTF2iCpbjdSwJwz91P8=;
	b=UgWGOAErlktuSDfHl85erYYOBwo195rqxSz6a1Z2n84V1yqCzGdiV6CdHDiE+v278q
	FwE9lsiEH1gi7M97YaMlhwgpeNsPcxGLBeJ6sJyob6JZGAznbBymdz+QqwxSdWutAvHI
	wGX+KG5FVOf8YTY2DLYRzD7kPeGINDCWVv+j/EPFmn69U1AZ/bYuaINy5SJ2c6W9Od0l
	Qtr1AJOdyBpmgqSoNg85hgeESP/RXxYRC+k8XgEpaicbYkOzHMmlyCup9gPiEvlCRae7
	0b/siK8l+lKieBOs+sqC/uFhnVyva/moA5lOExSvzpESyxAFjhwYmmpoaj43ExqUvulV
	LpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=m87E62SBbbUqZVFIL4hkASrfNTF2iCpbjdSwJwz91P8=;
	b=UiZY8gQVdfcgWosSwfy+sWSDTyjPRNWW5tzazSygdm/nEyrPa1AIfvTCrrzc3cF4bW
	CljFXYiPneL2EsT/az4tJMLoKGST/0B1BTTYHDGrphYZBFYW+fkTHw4ucSY83CPnGDZm
	YWIfSuHNArdgu8EnIvfY4vStMkBRHHIDFPQgNqcxySigd9zXnc91DYg6LCrw+UJqA3m4
	MP82xl2tzkDIoWtdhC2PseN3tbLgXsoUNmg5m/kaLucivKRn0EyLZg3OLyRpg9Lpz5Mb
	5S+3erd8sV+tOqVg1l3jne2K2b0CuYnma96jN0XCFqeydsSjwld98FV2YHjW1lkqe4qX
	cJNA==
X-Gm-Message-State: ALoCoQkeNqMEV/HZ0zM0qDqTvd8Gg5gY85yI3+omi9erpwkzM9C0r6tqOxH9sLs0jdFr8f//HbdT1Y2ZdWaJ5Ox/mf8MjUjqQvDEKxYSKGookv7xgZctTs4=
X-Received: by 10.107.3.144 with SMTP id e16mr15283491ioi.99.1449833764131;
	Fri, 11 Dec 2015 03:36:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 03:35:44 -0800 (PST)
In-Reply-To: <1449506630-31407-1-git-send-email-maxin.john@intel.com>
References: <1449506630-31407-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 11:35:44 +0000
Message-ID: <CAJTo0Lb5sXV=EScpBX7kfLsMRdvsMbjOnthxwrVVO5E91uRHTQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2 v2] libical: Upgrade 1.0.0 -> 1.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Dec 2015 11:36:05 -0000
Content-Type: multipart/alternative; boundary=001a113ecf407eab5c05269dba56

--001a113ecf407eab5c05269dba56
Content-Type: text/plain; charset=UTF-8

On 7 December 2015 at 16:43, Maxin B. John <maxin.john@intel.com> wrote:

> From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> * Build system changed to cmake.
> * Patch build system to not check for perl (we use host
>   perl which won't be found)
>

Still getting the odd failure in libical.  In all the builds last night it
only failed twice so its likely a race of some sort:

http://errors.yoctoproject.org/Errors/Details/22351/

Ross

--001a113ecf407eab5c05269dba56
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 December 2015 at 16:43, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D=
"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><span class=3D"">From: Jussi Kukkonen &=
lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>=
&gt;<br>
<br>
* Build system changed to cmake.<br>
* Patch build system to not check for perl (we use host<br>
=C2=A0 perl which won&#39;t be found)<br></span></blockquote></div><br>Stil=
l getting the odd failure in libical.=C2=A0 In all the builds last night it=
 only failed twice so its likely a race of some sort:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.yo=
ctoproject.org/Errors/Details/22351/">http://errors.yoctoproject.org/Errors=
/Details/22351/</a><br></div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113ecf407eab5c05269dba56--
