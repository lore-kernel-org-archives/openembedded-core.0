Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pwqby-0003Vx-Mv
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 07:41:38 +0100
Received: by mail-fx0-f47.google.com with SMTP id 8so4854651fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ykTQA7a2rT1zC2MIolLE+Mu6RDRc8xDVm2O3jaGWqto=;
	b=I0wu+hUJY8qPsEs37B/sEplFCcmyYNIcFvrrus/nd20/7+FzO6CZGE2Gj1S/nGl+1q
	j77VZhOBNNzCfZ4rVAy5U8bjhBQ/+jXI2MKTZFZS4X2ggv4HnxkOLDWpvGjgrN9gLTW/
	NGHP5tiKQy+LuikqiEQuk4azOhVabK5LRHm0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=fhqBjxY2aW8TIw0Rj4THJjo9zwqyyzxcGaP+iE5qxl1Z/7a8lWGATsghphpSaCe8B6
	aFJTT13q5waQWZ1ydnb7Tsv2t/xV9AGMADRRWiD7QLOaElP9pRKMiLPQ9JqBeMjP5FOd
	MzB/XYvrq9k5ON7wix4Rmb07a9JjzposNg9WE=
Received: by 10.223.76.147 with SMTP id c19mr2147048fak.55.1299566407127; Mon,
	07 Mar 2011 22:40:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 7 Mar 2011 22:39:37 -0800 (PST)
In-Reply-To: <1299135167-18330-3-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-3-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2011 22:39:37 -0800
Message-ID: <AANLkTi=bCN5b7TmByhECJpRYf05q3i6FKSDk5GSh1-3N@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/6] distro_tracking_fields.inc: Use 2.6.37.2 instead of 2.6.36 for linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2011 06:41:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Mar 2, 2011 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../conf/distro/include/distro_tracking_fields.inc | =C2=A0 =C2=A06=
 +++---
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/c=
onf/distro/include/distro_tracking_fields.inc
> index 1dab90a..beb18e2 100644
> --- a/meta/conf/distro/include/distro_tracking_fields.inc
> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
> @@ -2884,9 +2884,9 @@ RECIPE_LAST_UPDATE_pn-libtool =3D "Nov 8, 2010"
> =C2=A0RECIPE_MAINTAINER_pn-libtool =3D "Nitin A Kamble <nitin.a.kamble@in=
tel.com>"
>
> =C2=A0RECIPE_STATUS_pn-linux-libc-headers=3D"green"
> -RECIPE_LATEST_VERSION_pn-linux-libc-headers=3D"2.6.36"
> -RECIPE_LAST_UPDATE_pn-linux-libc-headers =3D "Nov 8, 2010"
> -RECIPE_MAINTAINER_pn-linux-libc-headers =3D "Nitin A Kamble <nitin.a.kam=
ble@intel.com>"
> +RECIPE_LATEST_VERSION_pn-linux-libc-headers=3D"2.6.37.2"
> +RECIPE_LAST_UPDATE_pn-linux-libc-headers =3D "Mar 1, 2011"
> +RECIPE_MAINTAINER_pn-linux-libc-headers =3D "Khem Raj <raj.khem@gmail.co=
m>"
>
> =C2=A0RECIPE_STATUS_pn-lsof=3D"green"
> =C2=A0RECIPE_LATEST_VERSION_pn-lsof=3D"4.84"
> --
> 1.7.4.1
>
>


