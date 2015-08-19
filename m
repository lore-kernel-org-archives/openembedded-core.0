Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEFD73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 19:56:18 +0000 (UTC)
Received: by qgj62 with SMTP id 62so13064791qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 12:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bpTv5Rr1k2bBAjHfcwsjGpovT1uXvraPn1SwmEf8FVQ=;
	b=EY0R8LeT9ktk834apAFOkfSebZ+2ehkPobRjw18BieyOsdKWChYq+DnsFVE7KkTS5I
	+Cbc1pvWdOrrWF/VzIPA72kAj+vkx53z0hzkJxWdvxcFJA6ov3whfBhU9wHVsS7w5bGd
	ZNcR7hIH4aJ2anpJbZ14v1XQqBsuozslqRdrHaDXUuIs+1YJC+ipPIiB7wt6ljyZaNr1
	Jxg6jgqOxlnqx2pngjm+w0u69puvNayeKdMcLsWZaaHPziBnaBkWWTFDjuhSKcML0MHv
	s5gbQWmT2dyOqdIiDpR/9fQQSWvrSEDrIOzH3wMVw47iA8hFTKP78TQ0WO/D+Qj+VHej
	lERw==
X-Gm-Message-State: ALoCoQliIk3FqOZSPTP+2Nj6QTeg5rOkrrnPnEqAYVG09ZdOpRtCD7QxZcDpfDj4K/OKgqPBgT6U
X-Received: by 10.140.108.244 with SMTP id j107mr12819349qgf.59.1440014178101; 
	Wed, 19 Aug 2015 12:56:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 12:55:58 -0700 (PDT)
In-Reply-To: <5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 20:55:58 +0100
Message-ID: <CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Wed, 19 Aug 2015 19:56:20 -0000
Content-Type: multipart/alternative; boundary=001a113ad8fa8ef9de051daf6db9

--001a113ad8fa8ef9de051daf6db9
Content-Type: text/plain; charset=UTF-8

On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:

> There are many reasons, for me its overlay support for systemd-nspawn,
> networkd has got many new features that is now usable w.r.t. IP forwarding,
> vxlan etc.
> and it has many bug fixed in those 2000 odd commits since 219, no
> different then any other package upgrades we do in general it keep the
> upgrade workload lower as we roll the releases.
> Any specific concerns ?
>
>
Can we get an updated patch with a clearer commit log?

My concerns with the systemd upgrade were simply that until now we were
tracking the systemd-stable repository.  If we want to change that policy
to the latest release, that's fine by me.

Anyone else have an opinion here?

Ross

--001a113ad8fa8ef9de051daf6db9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 August 2015 at 16:41, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div>There are many reasons, for me=
 its overlay support for systemd-nspawn, networkd has got many new features=
 that is now usable w.r.t. IP forwarding, vxlan etc.</div><div>and it has m=
any bug fixed in those 2000 odd commits since 219, no different then any ot=
her package upgrades we do in general it keep the upgrade workload lower as=
 we roll the releases.=C2=A0</div><div>Any specific concerns ?</div><blockq=
uote type=3D"cite"><div><div dir=3D"ltr"><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><div></div></div></div></div></div></blockquote></block=
quote></div><br>Can we get an updated patch with a clearer commit log?</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">My concern=
s with the systemd upgrade were simply that until now we were tracking the =
systemd-stable repository.=C2=A0 If we want to change that policy to the la=
test release, that&#39;s fine by me.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Anyone else have an opinion here?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ad8fa8ef9de051daf6db9--
