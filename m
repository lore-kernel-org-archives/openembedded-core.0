Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UTEmG-0006Yk-1h
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 19:07:12 +0200
Received: by mail-vb0-f41.google.com with SMTP id f13so3953512vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 09:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=3EdDaOSNkme90M9Sz3MK7ySvyqoI5ceiNqDk8XrCaUA=;
	b=U5JfrA6WffClg5aGojdcgMnaB5XMH4zhGyFZTSzIpfzHgUlwHodFnsPZ4+gsnIUr6n
	UuazHmNeBZtiFHN2sXOviBY2R2ANBi9gg3KspxH2vTJak6ZprfX8de96GGZexIEVfFyJ
	uN5zWjpMxg6HKTzTOo4x/hvXBFbuf/wiHKbrxSzD/YBFVvBmU3XV7nGAoFIygHrJiXi4
	9fSlqGBjUx0OXUAxcKF4LSsZOPO+2B5nBWhjT8KIz8RMIBCFXvY9MBNaniWZkWDOSZCy
	G0edqr8jSgro679QGrapn6CsexQrq8ICFZUBp6/TL5oornAXUGqtfoaA/ghqkCyniEYU
	MmHA==
MIME-Version: 1.0
X-Received: by 10.58.198.79 with SMTP id ja15mr12290985vec.15.1366390176624;
	Fri, 19 Apr 2013 09:49:36 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Fri, 19 Apr 2013 09:49:36 -0700 (PDT)
In-Reply-To: <1366377176-27277-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
References: <1366377176-27277-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
Date: Fri, 19 Apr 2013 18:49:36 +0200
Message-ID: <CALbNGRS1LGXNVHxiR6OB5apqKn9UDHtapQqJriRS0Xt8mhoAaA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: Replace broken png files
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
X-List-Received-Date: Fri, 19 Apr 2013 17:07:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 19, 2013 at 3:12 PM, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
>         connman-signal-*.png files were corrupted and this caused
>         warnings when starting connman-applet.
>         The patch overwrites the upstream png files.
>
>         [YOCTO #4060]
>
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
> ---
>  .../connman-gnome/images/connman-signal-01.png     |  Bin 0 -> 490 bytes
>  .../connman-gnome/images/connman-signal-02.png     |  Bin 0 -> 496 bytes
>  .../connman-gnome/images/connman-signal-03.png     |  Bin 0 -> 492 bytes
>  .../connman-gnome/images/connman-signal-04.png     |  Bin 0 -> 470 bytes
>  .../connman-gnome/images/connman-signal-05.png     |  Bin 0 -> 419 bytes
>  .../connman/connman-gnome_0.7.bb                   |    8 +++++++-
>  6 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
>  create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
>  create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
>  create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
>  create mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..33247c1e2db4304e48ea0a6145be4de6e420882b
> GIT binary patch
> literal 490
> zcmV<G0Tup<P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
> z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2G&}Dr@$>)y03CEi
> zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00B-(L_t(I%k5O5PD4Qu
> zoZXqdq)#-6CMbeI5`w`$RU9NZf<X`@|AHhTL4hLyM{3F^@J9~;@3_|%O7kEX*6rQx
> z?C#9o0{`~gW<BGlGk)D-s&8f2SC_Q`Xv}bSev!|611l1?clPGbd$hg_;6(~J383i(
> zjJw;L+TNu(J~@RV;BK%PxmE@a1vWOfGK`c!=gL&fw;loMBP=37cfeMx`0?SshBYua
> z4i1k%CQyPkZ=8}X$193Q38T?^L4}|~EQR3oS?%V4r)|smfdY{N*0hNNEGi`9dmK+D
> zPiqF$4GiP){<A2gNGKDPz@k8RG`0j-N*E4@g)gLt{QDUKrA!4S7zxKxV4<q2>^p^s
> zl(&k(AZMpSch6#eDc+!}fZ}1K=-j)yKaK9+n~G{M==dq6ZV*}K?Qs6t+AOD{GaU<T
> g(S7{`tN4%X6`T(*H@KiqK>z>%07*qoM6N<$g7W0Y-2eap
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..a94fb952ff6cbea25b06c261267fe9a82d77f981
> GIT binary patch
> literal 496
> zcmV<M0T2F(P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
> z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2G$Z^+X`%oC03CEi
> zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00C4<L_t(I%k5M#N(4a=
> ztnRL!*x<lOOfD2LG2a&`n287mV(1GD{eYn$7>H(q=E52H03YB>)SEHT9cOP(@0L|e
> z?5t<EYpScd2l$WQ4(VAxn#ijflYN<;ot{(zAc<iA;4q)}2BrtBtgg4ud$hg=;E{Bw
> z8GzIa7+06)m3&yUy|V|pLscLXc6A1JI+m7)8HNlnwa!wsTXzTfS?2CARX{p2zP-7w
> zAPEA+#^x5x0*r*DcTLS|jXRoWBnE@ULJER~S#&~8C%tO{kLs554|I5NNUAS#Si#WD
> z=hOK3;%VVygK)Gvyr&Vt1Imj^U>aenNHT{MccX^_hzRa^`^^a>vlK=`%%HOv#~2aE
> z&pB5k+(Uj<1Olox7^-SE^Go1yOc=kuG-o$>BUd&z%~WS=9Aj(&hY*@YW+(~TlyQ@9
> mrlK(&Q)1fp>Ia_UKZ-X`7C)%O7ejFX0000<MNUMnLSTZlN5kg;
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..b5eb405a9009722025c1e93e233f8dec676ff9fd
> GIT binary patch
> literal 492
> zcmV<I0Tcd-P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
> z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2GzlmCpmYEL03CEi
> zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00B@*L_t(I%k5M<PQySD
> zee+Ar1rSY2glOn}4TK_5AWBY<G8dpkLZXPsDL|n>v~Yl2Byo0@g7~v`APEN1FxBkX
> z^YrGu*#-XNw}U$NPaEf~z|^kHZf~wL0uYICad}nNI|HlraCmgmu6G#y7{HsVfkgns
> zPQaMl-(|G2=Jf0wY6fNkHSF3M*wnCp&@W+Bdk~hLrD%_C2Gy#~%plAF?Z|jEo@GTo
> z9P}a5gQ$Yyho&Nh#@{gS@#VE9g+gm)sVP{v>0JwWT8x}jeOacW2B|R=vF$V-jc0qS
> z8-(GY|Kt&f%e-o60IMj38IiV-;$iw+=FtOUm{$x<A*!Vmq6!iLZ({83@UW=P0a)gX
> z+T%h{mV_ZQmu7wn96Tb_Mt66F`8@fDHN9!Vyjf#+Pk;j=@;n7r5!4CFnsuWuwxYcq
> iX{`I6{lHWFNAV8gNn5(2{=AI<0000<MNUMnLSTYw4$qnZ
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..be54419fa74db126c4039c27566584e5b4d5c26e
> GIT binary patch
> literal 470
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=G`DAk4@xYmNj^kiEpy*OmPW7q6HxgJ5ExI8aEo#5JPCIX^cyHLrxhxhOTUBsE2$
> zJhLQ2AtWPJ!QIn0;C+f}9s>iTm8Xkih{fr*A%=cO3<PA}-wOZSp)I&*;d%FU&Qtb0
> zIQ5%BRp@RlGY4yc;z8zjvIU-RVx@$R^98-rQ;=GA>ei=}va*~9^80y>Ki15=>UuhJ
> zxz_HT`?Po%Oxd1`Prv&sCFymVg`K7JI{%EnA_rz~<vYUTpe~ra^`6Mv??r~~rF<@I
> zYSPyo!|vGcbz!n*7Ji?5bU`UYfN<xW;sm7wZ&q65+p-tG{>XTEcXgfbVR<KgQL!Ua
> z&gVJAe2adkV5fOCV^M{AfB5UO7q9akDl)7WV7+4gQC_Lx3&)M7&IM`g+Igpsukd3s
> z35k{6!;~m38qIx}M=DrHX+pqpD~5e5C)d7z{e(yG;ENNioQpUjUoU*6*>>pqZ4*hC
> z$8y~sPBIHJW_hfM3*1|uGV$@n^v(0T60L%2w#WZD5d6pe2Meo5@q`BPx+q|9GkCiC
> KxvX<aXaWH74zpnZ
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..1c40ac9a10bcf50c437c8cae475441b5900cfb16
> GIT binary patch
> literal 419
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=G`DAk4@xYmNj^kiEpy*OmPW7q6JHX7FXPYM_v8iEBiObAE1aYF-J0b5UwyNotBh
> zd1gt5LP$ocg1e`0!21-{JO&0vc25__5R22v2@<T$vTxiE|6iF_aQcz;|HK)u*sPc6
> zGbelTxPALpy-KR*S?MdOH&Zq;^=$m`Kln-M@iSKwdRqU_S6Ux@Hld_>&ZV#h!;bq~
> zI9mV9&%b_OnVs>*gD+1LdV25g_+V!A-~M78`_2=Jm4Xt@Ke_Y&mixr=9aE_L`)Brv
> znm=sTD!L5G8@k2r{K=nhAl-A2?JTR*6chO#$3M4rUZ41L2QS;s6MA)G5{G#<_08it
> zme8CQ|36>aTo|a})l7|=J8aE++VUp2ddN#O{|Mc@{_pml85}^<pMF_=0xX#(Xvf%-
> z$R_!Fd$Zvg1?ByG2FDJmYlZGP9;B0$A`vAz`wKh6`;%#{4eK4Y1H+EN)78&qol`;+
> E04bEH<^TWy
>
> literal 0
> HcmV?d00001
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index eee7a11..6299e70 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -11,10 +11,16 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
>  # 0.7 tag
>  SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
>  SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
> -          file://0001-Removed-icon-from-connman-gnome-about-applet.patch"
> +          file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
> +          file://images/* \
> +          "
>
>  S = "${WORKDIR}/git"
>
>  inherit autotools gtk-icon-cache
>
>  RDEPENDS_${PN} = "connman"
> +
> +do_install_append() {
> +    install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
> +}
> --
> 1.7.9.5
>
I thought there are efforts for libpng fix ongoing. If not: let me
know because meta-gnome's network-manager-applet needs same (seems
they use same icons).

Andreas


