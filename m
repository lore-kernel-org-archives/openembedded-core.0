Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id C449371A61
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 17:22:54 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n204so386796789qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 09:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7aosip7oBuujP+VhvwsEoqgP0z7QNI/71c5Wp6iyKpY=;
	b=gnEktWiz57kEbqYMnPFaCF2/GH4fyifmpdZArxpIsNWGPiDyprZE0kI03YnDOEQJlK
	JhB9wMzkjOQ5VTIEl+eD1QKyDcJIf3CXzQqE2HB9eykpIHSsEA8FIo6wDv+6lYKmC95P
	W2cy/kokl7pGV6Lbc3n20dbJT6D9W+thRfJqU0hlMvCvX7DL3wfdxi7tNSH8iJ5Cx+20
	+sJmywgVLvhIzBMKe0Ig0pgr/oxJZzUuMyxi04PYvyVVVQTxYN2xifbKa/9E43/Mh6aM
	N8ruCpdhHX2PA3W8j6bqJ7CR6rDIuXOgtIehXqr0ThSnGcCfc58ylJInJEjSlGQeu6Ay
	WeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7aosip7oBuujP+VhvwsEoqgP0z7QNI/71c5Wp6iyKpY=;
	b=IFGq6g3clxYd0mbCy4HSv5CL2eyDTJg5FSkp0V+kxwknKWtf6sjt7xkJyFrehUlH6l
	dpQeIZDR7WewCFNEiBgWdKRXJSuln3dkR5sRR+DVDV8HdsxcYptRBMN1lm9vHUoz5Kye
	CSqWQZOL13MIGKYE7CQJQ7ShSc/sSX8RtvYN1GteTZbauT+3ps2aav6AJh5kHfTnWpR7
	uNixuuXTH4buCp10cxocU560ns57ofykVoXHHZaWbNMDlF4cyTHQOqTjr1Pn9OckIMTJ
	MsOw2a8kDjgCuLGv9tbU/c2O+DDDqbs8pokVWCG3EdmcPhvZbS/ESWdS/aci59y3fNcN
	9omg==
X-Gm-Message-State: AKaTC02evRxseJg1I09OrfdqqQi85BqGGUszX8S9pl7YRmfKTMRnBSoN5nKGkMAyLDD44o+fzIQbYoBAYY0GCvzT
X-Received: by 10.55.5.145 with SMTP id 139mr56157102qkf.77.1481044976473;
	Tue, 06 Dec 2016 09:22:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 09:22:36 -0800 (PST)
In-Reply-To: <1481024991-5882-22-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-22-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 17:22:36 +0000
Message-ID: <CAJTo0Lb2fVvMAtrTFLQwMjWhubMyF_Cbz7ccDxgsdHPmKnwruw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/33] package_manager/deb: create Packages.xz
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
X-List-Received-Date: Tue, 06 Dec 2016 17:22:57 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84b8601f054300a766

--001a114c8f84b8601f054300a766
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> +        xz = bb.utils.which(os.getenv('PATH'), "xz")
>

Are the relevant dependencies present to ensure that xz-native has been
staged?  Is it always present because apt links to a library in xz so the
binaries get pulled in too?

Ross

--001a114c8f84b8601f054300a766
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1cm" cla=
ss=3D"a3s aXjCH m158d3fab302afc58">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xz =3D bb.u=
tils.which(os.getenv(&#39;<wbr>PATH&#39;), &quot;xz&quot;)<br></div></block=
quote></div><br>Are the relevant dependencies present to ensure that xz-nat=
ive has been staged?=C2=A0 Is it always present because apt links to a libr=
ary in xz so the binaries get pulled in too?</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84b8601f054300a766--
