Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 202E776DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:19:37 +0000 (UTC)
Received: by iodb91 with SMTP id b91so20111193iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=/Y658yA5aia+x01hROAaLLGFAW9JOMa0s2RFxEqiroA=;
	b=XtJEgjfEI5sObLx5w2YDQhfUVEVT7+/DjrNOKk6V7rUmX+RG2L4w5OXlGbaqJ4bBXn
	sYL5MsLA2Y3obc524mo2NcBPnzMt61n6/s06Em5BbOGm16XB8kHkeo6YwtMAdXp4tlG3
	vSf/b4Ua6P8KJFY2khBlbLJDFFoO8X8XG4Ha/Hm2KcjoUM4U4YnNdEYA4Jwa5Rb84s+i
	O2OBUG+AV3tlJypM6uVGOIvLZCCoO89xWZYnQI2Ex7O7Fet8AmUCJlGZNWdkFxOaZQ9+
	DH4H2jKp05gEU+PNAXzZQPbxDK7WPFctToD+EBjplY26wuUv50bSrx9RfMrJoNFXCf0K
	DL9Q==
X-Received: by 10.107.40.200 with SMTP id o191mr3842026ioo.83.1440598777392;
	Wed, 26 Aug 2015 07:19:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Wed, 26 Aug 2015 07:19:17 -0700 (PDT)
In-Reply-To: <CAJTo0LaO2RSxb_RC-aDUo46dQAoQPwArNJNDCOkkTdEKVUwZhw@mail.gmail.com>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
	<3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
	<55DD7C88.4080305@collabora.co.uk>
	<CAJTo0LaO2RSxb_RC-aDUo46dQAoQPwArNJNDCOkkTdEKVUwZhw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 26 Aug 2015 07:19:17 -0700
X-Google-Sender-Auth: Y9eYaUkMkQR8meqe902sQcLKriY
Message-ID: <CABcZANk_tgWL0VSvRCsA=_X7Yz25OQcgfAgek98WOWmZ7J5tug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Wed, 26 Aug 2015 14:19:39 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8c63f576051e378af2

--001a1141cf8c63f576051e378af2
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 4:01 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 26 August 2015 at 09:44, Joshua Lock <joshua.lock@collabora.co.uk>
> wrote:
>
>> I do all of my builds on a separate partition in a directory hierarchy
>> which is owned by my user - if I'm understanding this correctly I'll get QA
>> WARNINGS for all of my builds with this change?
>>
>
> The paths are prefixed with ${D} so pretend the commit log says "in
> packages".


Heh, indeed, it's a package QA test. do_install runs under pseudo, so any
newly created files there, or files chown'd to root, will be fine. If,
however, a recipe does a cp -a or so to install without doing a chown,
you'll end up with files in your rootfs owned by the user that did the
build -- not good.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8c63f576051e378af2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 26, 2015 at 4:01 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><di=
v class=3D"gmail_quote">On 26 August 2015 at 09:44, Joshua Lock <span dir=
=3D"ltr">&lt;<a href=3D"mailto:joshua.lock@collabora.co.uk" target=3D"_blan=
k">joshua.lock@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div style=3D"overflow:hidden">I do all of my builds on a sep=
arate partition in a directory hierarchy which is owned by my user - if I&#=
39;m understanding this correctly I&#39;ll get QA WARNINGS for all of my bu=
ilds with this change?<br></div></blockquote></div><br></span>The paths are=
 prefixed with ${D} so pretend the commit log says &quot;in packages&quot;.=
</blockquote></div><br>Heh, indeed, it&#39;s a package QA test. do_install =
runs under pseudo, so any newly created files there, or files chown&#39;d t=
o root, will be fine. If, however, a recipe does a cp -a or so to install w=
ithout doing a chown, you&#39;ll end up with files in your rootfs owned by =
the user that did the build -- not good.<br>-- <br><div class=3D"gmail_sign=
ature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics</div>
</div></div>

--001a1141cf8c63f576051e378af2--
