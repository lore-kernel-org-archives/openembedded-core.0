Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 327226FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:26:19 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id q126so215488405iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 05:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JB4ZSi1Huit9s8awP/fac/DRs+PW1xFSM3W5amSE08w=;
	b=I+ksINGrl+mR60DyQMAJ7oNwLLeIMb9NZ7Hvj/0KivtVgbI60PWRjvTPLnmjbDyCi3
	mdtGbQNDTFh3HLR3sYj3lerNOQ8FCDQGfRTqohAgHUObXdMtQw9Us020mRXz9rTO1odB
	9n1k6VqDVf5xs1sXqWvBucEaRlUJ3KDqAOK5f7HRhtoYNc0CL9R0IE1y05FLAzrD3ykZ
	tdUUAqsTX3DTcettlhX8XG0RD6zh3gH9QIMJg4qaf19XsTFq14k0JfnxxaS0f2UtPrhc
	LXvJ1bd0BKMVPBkwp38CRnGq7DZQqaDE4B3AkkcaqX0o8e14BPh2qaN1XPFXq0eLpnLb
	QSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JB4ZSi1Huit9s8awP/fac/DRs+PW1xFSM3W5amSE08w=;
	b=PlyOpF9fAEXhslC/wHwVF1XFG/HiZmZXo+AsaXkpOKpS17JgIpW9C4QARX9c6Qci7k
	e3PIP5MkNZCHGdk7jdVRsI984qj3JzoybpENi5qB0V9jR/oQ1kiiU/8WCFG7fPB3vgVb
	UVpRJEDBljPlM0hSbRTcGDJMn+XOO/8S6WAncyOBFNVIYNbzBHv5c6Zijvjz5omMtGL8
	a2eZXTnY3MEf1V3B8R1UqHOjlFRIW6Rp2jc6IztCXOT0GMnq13HjGdCAnSOb2yfadOpW
	T4zzMasY9kOIGQnt1w+6k440wW5gjirPrIPJ9iLaLbQg7tNg4sitAuXHmuX2mMhdCE64
	k13w==
X-Gm-Message-State: ALoCoQnobFGM2Cxvr98bc60sOc1LjWgDaewuAGrm9q1ZxEaa7h3DFaJbgKTKDWZJeXYd5dFL7UD5+vl1y9vi87c973jhlhIwRnAI6vCmJIHMpoZiAMYTHLc=
X-Received: by 10.107.155.209 with SMTP id d200mr34499245ioe.133.1450877180529;
	Wed, 23 Dec 2015 05:26:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 05:26:00 -0800 (PST)
In-Reply-To: <567A9EED.7040305@topic.nl>
References: <1450857946-8428-1-git-send-email-mike.looijmans@topic.nl>
	<567A9EED.7040305@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 13:26:00 +0000
Message-ID: <CAJTo0Laj05q8FkFWB+=qb70Ax55W99LKNEKXHMOhJW8eZujuxg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libav: Add "--enable-gpl" to PACKAGECONFIG[x264]
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
X-List-Received-Date: Wed, 23 Dec 2015 13:26:20 -0000
Content-Type: multipart/alternative; boundary=001a11403402f566db052790aa53

--001a11403402f566db052790aa53
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 13:17, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> I don't think we have dependencies in that, so there's no easy way to tell
> people that "if you include 'x264' in the list you must include 'gpl' as
> well"?
>

I think the best approach here would be a comment.

Ross

--001a11403402f566db052790aa53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2015 at 13:17, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":12c"=
 class=3D"a3s" style=3D"overflow:hidden">I don&#39;t think we have dependen=
cies in that, so there&#39;s no easy way to tell people that &quot;if you i=
nclude &#39;x264&#39; in the list you must include &#39;gpl&#39; as well&qu=
ot;?<br></div></blockquote></div><br>I think the best approach here would b=
e a comment.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a11403402f566db052790aa53--
