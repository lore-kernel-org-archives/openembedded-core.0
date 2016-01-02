Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5AD6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jan 2016 21:01:44 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 1so81324575ion.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jan 2016 13:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gcuZV+aqzIs66XvqUrfXN2b7Ylx8Bk1T7bPvBdJkOP4=;
	b=0dyvsmEFH4TaDb+fLeHcyW2l/vx6EnM9KxAqdqdZNKYozNt14oQaYtevDuePN0gl2C
	ZugiGcT8uwqP9yI8T14HJsLVci8+FpJU4pjLMFZgsQ7tMJSL7H7RNOTAKA4aTG99TDL7
	4G+w83gZAWJ+8aqp2VKhuoNzKjHOxlFNoTXOJ8mCgKAJqxorpf5zLBiFLL0UNJ5RlRe/
	I7+X3St8PABwzz/ck8lfpciU20At4aMl8fCGFO/QIcvUwS3q6qdPhznsQGiERPYf+458
	am6rvyDGLhNpDi2R225KoKCUTXpV2Sdm/GULOZrn5/ZGJCxBVytGv1yOMe9be0vJAdxv
	kATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gcuZV+aqzIs66XvqUrfXN2b7Ylx8Bk1T7bPvBdJkOP4=;
	b=Fc0kAfg0s6+8ShRU5cGHmbDeB0imw5OZT5ABRg3tifrrThNNcm9fAqSuZaBOe1Z8/K
	/5DcFSDtqM6XWKbczX6P6XzHmuSRkSN2VqCzfvvK/RPt6dsihNJf7aCTkepsw9Wztd4E
	gOqt0fXHPA5K3iZSedKiYP7dJtMUPAkUXrrRDWDKkFqIzazYXDFvk2+OYJ2T3Q5+/AZ1
	anoh55bIyw82V5GM2/NIFBt8xfTAV5yCtcbTjdVCNCBVaZrAccWubfjbeEAeURYWYiIY
	/VdfkjFueNYwbRFt2jG1K1QtgrZbsAVF9Z7Gmp72kUB6JS7fk8W1upk8G+KbLrixDV9d
	tLCw==
X-Gm-Message-State: ALoCoQmSEsXbJKe3J6xRd0K2ii0qvlgZGpdfFRlEv0L1MSWRXsOBAla8N/brsoITuurpS6hj6/LYGU+l/OaVaOAaAuWSjXu/5AGmYRCSBh+Us6jLYdCnjrA=
X-Received: by 10.107.135.104 with SMTP id j101mr44563140iod.133.1451768505000;
	Sat, 02 Jan 2016 13:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 2 Jan 2016 13:01:25 -0800 (PST)
In-Reply-To: <1451388119.1472.230.camel@pbcl.net>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<1450910987.2002.86.camel@pbcl.net>
	<CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
	<1451388119.1472.230.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Jan 2016 21:01:25 +0000
Message-ID: <CAJTo0LbbzumOSU=shtASvr-BtoWGr5t0BaGe52XM1r4E=L-E5Q@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Sat, 02 Jan 2016 21:01:45 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92097adb05286032ba

--001a113ebe92097adb05286032ba
Content-Type: text/plain; charset=UTF-8

On 29 December 2015 at 11:21, Phil Blundell <pb@pbcl.net> wrote:

> Oh, yes, you're right.  In fact I don't build openjade-native
> routinely, but a bit of git archaeology reveals that I do have the
> following patch in my tree as well.
>

You're my hero, thanks. :)

Ross

--001a113ebe92097adb05286032ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 December 2015 at 11:21, Phil Blundell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":22c" class=3D"a3s" style=3D"=
overflow:hidden">Oh, yes, you&#39;re right.=C2=A0 In fact I don&#39;t build=
 openjade-native<br>
routinely, but a bit of git archaeology reveals that I do have the<br>
following patch in my tree as well.<br></div></blockquote></div><br>You&#39=
;re my hero, thanks. :)</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113ebe92097adb05286032ba--
