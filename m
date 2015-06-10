Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id AED436AC24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 10:24:56 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so15707305qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 03:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UgjghlbDd0BwgUkpvVtz8HyFhONNrz12TOhMKgzawAo=;
	b=bOfd4g4Y7ZrwmAHEmi8wwkRO2JBzD6U4sJGbwvZ4iKy++zliFlZDPSDGohd+EBHAjp
	AjebgS1mIoh6OyC3suLn6MIHOVVIGHB5rPzutosCW0PstrxGzxI3GLujjYtyGLJRDyiF
	hgPef49Gvm4sd2TEyaqgkUFfU6VOLHktdqmEw3VV5dzN9PcN0eNA8LffiSrXP6Uf9R+6
	9HZvubPYgb31q6NExZR0QiDH6kKpN6lc1hUsCBftBSFWRKiav9wLl9TOtxgOAdvLY5Ba
	b+gaSNyh+ug3WbaB4wo5NVTgm0s0Kt/llWMUZ8tsiy24yyQq81MBlqUQwslrEqUsh7GE
	FgjQ==
X-Gm-Message-State: ALoCoQmo4/ORNbMLBJiolzjljkYQ02QlVYCK2DYwtuF2Es0mLWavviVO92mQw59+EBKwBJ0Z/ACH
X-Received: by 10.140.89.104 with SMTP id u95mr2780105qgd.15.1433931898203;
	Wed, 10 Jun 2015 03:24:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 03:24:37 -0700 (PDT)
In-Reply-To: <20150610100353.GA2400@jama>
References: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
	<1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
	<20150610100353.GA2400@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 11:24:37 +0100
Message-ID: <CAJTo0LaCSsGVpMahP9sVRLdW9-nt_BGMRJzqYrKbCRmctfqUWQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] remove neon from oe-core
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
X-List-Received-Date: Wed, 10 Jun 2015 10:24:59 -0000
Content-Type: multipart/alternative; boundary=001a11c135f66cc66505182749c4

--001a11c135f66cc66505182749c4
Content-Type: text/plain; charset=UTF-8

On 10 June 2015 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> Yes, meta-legacy not included in my world builds looks much better than
> dumping untested changes to meta-oe (both gstreamer-0.10 and bluez-4
> dumps didn't even parse in form how they were sent to oe-devel ML).
>

The patches not parsing is obviously a bad thing, I'll try and ensure that
doesn't happen again.

Ross

--001a11c135f66cc66505182749c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 June 2015 at 11:03, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":dp" class=3D"=
a3s" style=3D"overflow:hidden">Yes, meta-legacy not included in my world bu=
ilds looks much better than<br>
dumping untested changes to meta-oe (both gstreamer-0.10 and bluez-4<br>
dumps didn&#39;t even parse in form how they were sent to oe-devel ML).</di=
v></blockquote></div><br>The patches not parsing is obviously a bad thing, =
I&#39;ll try and ensure that doesn&#39;t happen again.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c135f66cc66505182749c4--
