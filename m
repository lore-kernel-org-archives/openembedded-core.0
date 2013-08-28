Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE0206BBC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 23:18:54 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so5912129wes.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 16:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=suD5XDjn9oeEJZFZ1n7JqTWnFLZR5HJBqNS+EajvzHM=;
	b=i/e1f7ng8csIi0scjkwxLRp2CPRR2OXZqgYKIFJ1VSHg01Sx0wdByIre6jHM1YDYHG
	RvjaLJtwQLSDpLY4TukKFlTczl91Y7nVCA+/7uWOoQbllWs7PJoUqSGwZyoVNH7T3fNz
	kdTk9orhoT4tZB1XtNYuwGlZnZTmWIiGTmB6m9nUZcTdonhNDubKZYUtHMsp+hMv00Uq
	zwKleYHWVGGvhWsrMFZe7/ZEDwcUbmFwNgRPZJNkwkcYq2R6aTVOvi5QsLymuzwBhTrZ
	9Cn8/XG47uV0MRj9FhBSmhgfUeRm9mIhustvTuGkDHy29j5FxFo2g8sWxyRY1YWiSVB/
	+2Kw==
X-Gm-Message-State: ALoCoQmLrp9ypUkZOtjxAl0HKx73XxUVQqSaIYxZHTvPApFsep3Vkt3M8EMTYlBUF+QwfefV5DmY
X-Received: by 10.194.80.39 with SMTP id o7mr500858wjx.39.1377731934907; Wed,
	28 Aug 2013 16:18:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.91.198 with HTTP; Wed, 28 Aug 2013 16:18:34 -0700 (PDT)
X-Originating-IP: [5.13.214.171]
In-Reply-To: <020301ce9e37$b92b36d0$2b81a470$@cn.fujitsu.com>
References: <020301ce9e37$b92b36d0$2b81a470$@cn.fujitsu.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 29 Aug 2013 02:18:34 +0300
Message-ID: <CAK18fxGZ0yUsPz1tT5dc5XtTS3qP1BvhOnG4qxHXyv75DG28Ng@mail.gmail.com>
To: yaoxp <yaoxp@cn.fujitsu.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass:WARNING: QA Issue: xxx doesn't match the [a-z0-9.+-]+ regex
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
X-List-Received-Date: Wed, 28 Aug 2013 23:18:55 -0000
Content-Type: multipart/alternative; boundary=047d7bb045c493823e04e50a367c

--047d7bb045c493823e04e50a367c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 9:28 AM, yaoxp <yaoxp@cn.fujitsu.com> wrote:

> Will offer the following warning when there are upper case letters in the
> BB file name:
> WARNING: QA Issue: xxx doesn't match the [a-z0-9.+-]+ regex
>
> Is there such a regulation in yocto that there can't be upper case letters
> in the BB file name ?
>

It used to be a bug in opkg. Isn't that still reproducible? I didn't test
it a while ago.
Here is the link: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3139

ag

--047d7bb045c493823e04e50a367c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Aug 21, 2013 at 9:28 AM, yaoxp <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:yaoxp@cn.fujitsu.com" target=3D"_blank">yaoxp@cn.fujitsu.com</a=
>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Will offer the following warning when there are upper case=
 letters in the BB file name:<br>


WARNING: QA Issue: xxx doesn&#39;t match the [a-z0-9.+-]+ regex<br>
<br>
Is there such a regulation in yocto that there can&#39;t be upper case lett=
ers in the BB file name ?<br></blockquote><div><br></div><div style>It used=
 to be a bug in opkg. Isn&#39;t that still reproducible? I didn&#39;t test =
it a while ago.=A0</div>

<div style>Here is the link:=A0<a href=3D"https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D3139">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D3139</a>=A0</div><div style><br></div><div style>ag</div></div>
</div></div>

--047d7bb045c493823e04e50a367c--
