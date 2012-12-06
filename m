Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TgUVO-0006T4-Rg
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 07:00:18 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so5517916vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 21:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=VVL6vp+rXTJAvZcA6c1sGmIW28oeyVU6ztHqTeW1AN8=;
	b=Nz3Mv0zUXSOIQy6O5GZWlxiV4LRGKN+fVZ+Lm2mRmDsoWnlT3ZAW2/WS4iUKxG13Pm
	w5VL21U3E+suaKt7VDOHOOMVcwClH5mXM7kZcl++85NZy1EX79JRM5+mcnK8Z4UE1cJ9
	XzKwy12fxJT/jdQ1QKVdvAKM0fdKHv8ZijS3lqEShCOYDrqVU51XoSVtNICCefIeiBSd
	cEeR6cs4so9gBnUVwbZGS58KbG7O/nmh+bRXtCDEmaGyaizuZzQZT0UhVREF2uDHzVmw
	1WyTHSfcImwqKIbOPMJj8yf/BG6MilE/AwBlaa/LgsEaCBnoJORH3aAAMApWer/ScTxz
	qtgg==
MIME-Version: 1.0
Received: by 10.52.69.176 with SMTP id f16mr187312vdu.97.1354772753663; Wed,
	05 Dec 2012 21:45:53 -0800 (PST)
Received: by 10.58.240.38 with HTTP; Wed, 5 Dec 2012 21:45:53 -0800 (PST)
X-Originating-IP: [203.173.40.32]
In-Reply-To: <1354700795-17864-1-git-send-email-ross.burton@intel.com>
References: <1354700795-17864-1-git-send-email-ross.burton@intel.com>
Date: Thu, 6 Dec 2012 16:45:53 +1100
Message-ID: <CAPj87rMCDQdTyiQKBC1cCY81-MLHJzhx859vP9s3adeDUXuxcw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlTNQAnxHR6V3Aj7cLWYmWXv4zvVnJV6byH/JB1IGY1igUIz184mR8nmImRb54hCoybsi0Q
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: merge internal libraries into mesa-dri package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 06:00:19 -0000
Content-Type: multipart/alternative; boundary=20cf307f3aa0bbc78704d0289cba

--20cf307f3aa0bbc78704d0289cba
Content-Type: text/plain; charset=UTF-8

Hi,

On 5 December 2012 20:46, Ross Burton <ross.burton@intel.com> wrote:

> libglapi and libgbm are specific to Mesa and it's unlikely that they'll be
> used
> on their own.  Mesa 9 also adds another internal library, libdricore, so
> prepare
> for that by putting these mesa-specific libraries into the mesa-dri
> package.
>

Wayland's DRM compositor uses libgbm, so please don't merge that.  libglapi
and libdricore should definitely be internal though.

Cheers,
Daniel

--20cf307f3aa0bbc78704d0289cba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 Decem=
ber 2012 20:46, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
libglapi and libgbm are specific to Mesa and it&#39;s unlikely that they&#3=
9;ll be used<br>
on their own. =C2=A0Mesa 9 also adds another internal library, libdricore, =
so prepare<br>
for that by putting these mesa-specific libraries into the mesa-dri package=
.<br></blockquote><div><br></div><div>Wayland&#39;s DRM compositor uses lib=
gbm, so please don&#39;t merge that. =C2=A0libglapi and libdricore should d=
efinitely be internal though.</div>
<div><br></div><div>Cheers,</div><div>Daniel</div></div></div>

--20cf307f3aa0bbc78704d0289cba--
