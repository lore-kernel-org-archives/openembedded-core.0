Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Px1fW-0007ow-59
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:30:02 +0100
Received: by fxm8 with SMTP id 8so5423761fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 10:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=TmS1cpfRRhXdnbeRRSY2Sb1t3MwWmZltqhKDYm5x10Y=;
	b=NvF2BLjZGhVPVfyN0j/X4t+PdsShnHBjeSNBMXoSu9LgVOOH7OXEDRFyv/+7g+RZpy
	JruSPkeOkxuV4E3D+OEBm/9LLqD4kTSfFBqOi2rbQjtuw3N/5plFqK+7lFHlbqQiIb84
	3GOKXkwRodjo2DE/eq9LR0DKLH58YchoHHfGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mtBg1tVWYG7JPx69Jo2HitAc2AQnE1YAq8axS8zCdYsGCaKld71ruLWxUq7uwIX5Np
	trOmQANAgb8PW/nNuCVIS925oWIFrFlCfbL8SuvyN7hyXTkYpGQtXTvORdNixptOJViK
	DU09K5o5m8Nf3ZqglSwebc/Aj+YQo0VZQVxQA=
Received: by 10.223.143.86 with SMTP id t22mr947738fau.74.1299608908066; Tue,
	08 Mar 2011 10:28:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Tue, 8 Mar 2011 10:27:58 -0800 (PST)
In-Reply-To: <cfbf50c235c2faeb53f43b42a12c49c022288488.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
	<cfbf50c235c2faeb53f43b42a12c49c022288488.1299544029.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Mar 2011 10:27:58 -0800
Message-ID: <AANLkTin=Fa4QVWbusXYg8j9BmqOs8TfWfLos9J_29a0L@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 5/8] connman: add xuser to the dbus permission list
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
X-List-Received-Date: Tue, 08 Mar 2011 18:30:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2011 at 4:29 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Dongxiao Xu <dongxiao.xu@intel.com>
>
> Some platform (like atom-pc) enables rootless X,
> thus the connman frontend run on it need the
> permission to connect with connman by dbus.
> This commit grants permission to xuser.
>

I wonder if it should be made some sort of conditional thing like
passwordless logins are done in dropbear.

> This fixes [YOCTO #779]
>
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
> =C2=A0.../connman-0.65/add_xuser_dbus_permission.patch =C2=A0 | =C2=A0 21=
 ++++++++++++++++++++
> =C2=A0meta/recipes-connectivity/connman/connman_0.65.bb =C2=A0| =C2=A0 =
=C2=A03 +-
> =C2=A02 files changed, 23 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-connectivity/connman/connman-0.65/a=
dd_xuser_dbus_permission.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbu=
s_permission.patch b/meta/recipes-connectivity/connman/connman-0.65/add_xus=
er_dbus_permission.patch
> new file mode 100644
> index 0000000..787d49b
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permi=
ssion.patch
> @@ -0,0 +1,21 @@
> +Some platform (like atom-pc) enables rootless X,
> +thus we need to add the xuser in the list.
> +
> +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> +
> +diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connm=
an-dbus.conf
> +--- connman-0.65-orig/src/connman-dbus.conf =C2=A0 =C2=A02011-03-04 09:3=
4:49.000000000 +0800
> ++++ connman-0.65/src/connman-dbus.conf 2011-03-04 09:35:21.000000000 +08=
00
> +@@ -7,6 +7,12 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 <allow send_interface=3D"net.connman.Agent"=
/>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 <allow send_interface=3D"net.connman.Counte=
r"/>
> + =C2=A0 =C2=A0 </policy>
> ++ =C2=A0 =C2=A0<policy user=3D"xuser">
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow own=3D"net.connman"/>
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_destination=3D"net.connman"/>
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_interface=3D"net.connman.Agent"=
/>
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0<allow send_interface=3D"net.connman.Counte=
r"/>
> ++ =C2=A0 =C2=A0</policy>
> + =C2=A0 =C2=A0 <policy at_console=3D"true">
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 <allow send_destination=3D"net.connman"/>
> + =C2=A0 =C2=A0 </policy>
> diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb b/meta/rec=
ipes-connectivity/connman/connman_0.65.bb
> index 0b077e1..8bb84a1 100644
> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.65.bb
> @@ -1,5 +1,5 @@
> =C2=A0require connman.inc
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0EXTRA_OECONF +=3D "\
> =C2=A0 ac_cv_path_WPASUPPLICANT=3D/usr/sbin/wpa_supplicant \
> @@ -21,6 +21,7 @@ EXTRA_OECONF +=3D "\
> =C2=A0SRC_URI =C2=A0=3D "\
> =C2=A0 http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.=
gz \
> =C2=A0 file://fix-shutdown-ap-disconnect.patch \
> + =C2=A0file://add_xuser_dbus_permission.patch \
> =C2=A0 file://connman \
> =C2=A0"
>
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


