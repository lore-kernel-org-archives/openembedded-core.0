Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pwqbg-0003Vx-FC
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 07:41:20 +0100
Received: by mail-fx0-f47.google.com with SMTP id 8so4854651fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 22:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=OwtSiFnSYPIP2pWqd+4zaBE+phlP2QMfJYmSorprRoo=;
	b=BtbOmiDK2MEhYUpt/pXpHoHQUoQYifk6UdIjX4Kr4INBejTA/vWmVw42VdQU5vyqtB
	TMzBRw1iSfsZ8/vTUF6S7kETZcCarjOCNrcL0IItqKR7ZFpgMlwqQmDmJ1slOyiTN3eY
	ZkM8GZUfkXo3fVQjbeyetP2A0TB6h6uaQcHjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=eL5J5zxh5UCbWLcz8uJEpn83rrlKZ2W8akdCUeZWC6aUlsvSpewrtmH3WMM8bGi8gh
	vn9eXLom26Wn5PjCHrnuF+5O/0MrQCHmW86rRsCabaEqiMMOFnIdb/C2kbIMxI1UTLZS
	Clk1WoIDGsvSnK/R+aSyyoO9ZF6A/H/4NF/yY=
Received: by 10.223.6.73 with SMTP id 9mr1921832fay.131.1299566389110; Mon, 07
	Mar 2011 22:39:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 7 Mar 2011 22:39:19 -0800 (PST)
In-Reply-To: <1299135167-18330-6-git-send-email-raj.khem@gmail.com>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-6-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Mar 2011 22:39:19 -0800
Message-ID: <AANLkTikVFZRWSrKRPFu5w1tWWixSKvdP7BPOVeOZuU_S@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 5/6] poky-default.inc: Change LINUXLIBCVERSION "2.6.36" -> "2.6.37.2"
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
X-List-Received-Date: Tue, 08 Mar 2011 06:41:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Mar 2, 2011 at 10:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/poky-default.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro=
/include/poky-default.inc
> index ef9f5cf..3ec5e1d 100644
> --- a/meta/conf/distro/include/poky-default.inc
> +++ b/meta/conf/distro/include/poky-default.inc
> @@ -19,7 +19,7 @@ GCCVERSION ?=3D "4.5.1"
> =C2=A0SDKGCCVERSION ?=3D "4.5.1"
> =C2=A0BINUVERSION ?=3D "2.21"
> =C2=A0GLIBCVERSION ?=3D "2.10.1"
> -LINUXLIBCVERSION ?=3D "2.6.36"
> +LINUXLIBCVERSION ?=3D "2.6.37.2"
>
> =C2=A0# Temporary preferred version overrides for PPC
> =C2=A0PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?=3D "2009.08"
> --
> 1.7.4.1
>
>


