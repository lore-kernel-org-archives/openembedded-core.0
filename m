Received: from sonic314-20.consmr.mail.ne1.yahoo.com (sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
 by mx.groups.io with SMTP id smtpd.web09.10549.1615303393590408456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 07:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=MEOwTU8/;
 spf=neutral (domain: yahoo.com, ip: 66.163.189.146, mailfrom: fransmeulenbroeks@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1615303392; bh=tTyS/inSKgYZ7LRzVvwKncbQ0Ye8PviHrofZD54ywss=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=MEOwTU8/z5uo/pJ5Jc5J+MGu2zxRuaJGxhfg2q6EAdJN/HloPE569cGJGMBNKdUcOPqWtudZo+OP4275AAvKVbg/X4aZ/yWkrGrZbFe0o22DVuDAqK9mHYIKpiiQID99rj1uC8GHhMTVWWYuMJ71DhSlpHDZvPMvP+y0YbaIlZGz6+2+PaBUH3TRWy+GqHZev9cpJur0DwZo66bIMvHWeyrdD3M9K5geiWA6NEkWgk35ZMmTJ3bg2Y3YNk6R6HCzQKqVbYNAC9dFbXAPoYAnx1mO3RSLOZmr+qXNRB3pXbXsJgLYDqrgVD1b/Xh61PSGnpjBPtew9B2tvQiMXn83iw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1615303392; bh=itqJ5f2cf8Nn36lzfqNtrq5oXCFTR6a/zt47jk+SF5Z=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=dkmrndWHlDi/fmlYLtZsu7qOnzrZfZlldRIDcUhkrBpph7+MiqyUBZTtjI/8vuAnVwZVYwnhykrH3s4e54qxvBTsLebVb/hDJcJ+BxKBdu5lje7pJtbqGHmRoUMBSv9tMalTnHqG5ZQMhWBUFR3k7gKxBGk7JUVhnCwYaH8A0MpMIfT8ypnNNc/Noniyx+ZlsJxxzAEONQwsuNtQzh6SFKSy3zXXsLUEoOIjF72ektvp6F3eZEEfDZXUA3wZYc3236g2K+oDOVvAUrTWjacdP/HEXrwnwz+vUCfxhSul1qEo2HOGSceNRaw1j9eWijfxfd2c5sPI0SrvrrkAvY2N9g==
X-YMail-OSG: 5ImrSOgVM1lMPyyj7yhllzGAEe9EwHAEkvAx_Y.HxgHBxpvrgnbkbNlcDXh66mM
 fIV7Gs3BMUd7zJYY2gXNA8QAML2ENCxVSXlMlSlzgNkEIoynfvzyxB1Vd5.XNoM32T2N2NYJ3TjA
 TkhEvsKTegftZvFieY6yY5UK2dpxPv7jFlmL.hwieZ4WpYYFEaACX0nHPkxmLNOD4ysOLFti89bG
 ZOmsawY9sIB5fc9Q9Rvg1yjryG0fWRd.NWdPcPGEJcAuHDdhoH1Q3BJ_TtQPiByJzoa.A7WV7ipv
 YkvtOVs5ewQ_UwjMHSmW7cb2MSS7ERth6R83TBKqGgP7OeK2PS0Bx5KEnH1Br.cHA_ScgGffTvo6
 3OeCQJReP_TH7ifMN.HeHiG0NF_mW33zIOscqIh_xgfYFBK_PSCkFiEgMhbtG4c90RBPnGWJ84wX
 ERbW5Hf9BdX5l169jTBiSCO3rZDvXNaatcGAb7fXpOx_saMGy3E0J8S0ZK4MQU1m0EBjD_sZeNoS
 w702YrVNMx.Sua7D2FcFYYs1yRLyWMPrA7w64GpKBziMaf6PoQ5cWctEN7g6Dje6Vk1LJrhTyxyF
 2HOBRV2saEIDgmLDp9u_PxPN88Eg6wGZMzpvru7TbkeFGljuunTG8tJNHDJtq67Vjb_DvyTmuT8u
 L0N2gSnQyQjRXVJZW02UPphs2lFIgHLrrEJylXkzI92ygYsnAkaRZKGTMA28.O8RDA0shTF3DrOH
 wriTylT_8MNFGWekRxM25TQlzJSrpzT79rd7uUF4ReGQiv4ldgjgXAvWk1N8XEHKpB2D2w6YD7tU
 ZimV_RXDAiQn7OFSSlYOgQCoXeUpm_MEXnMsfzy2eADNFL93S3WllY8wk0__sX6jYcnGYS9j_ySj
 aGblYTDwBSWZtYt2FkBM89mhNeE_Z.d_NksGmqSjs2rGoP6KRbKlR6nq5TDhvgpcWeZ5Qn8cvz8i
 IONT2NdZFaeZEEMbTHMRrjH0iEWxoBbM4rVmXwLhOHSFrxHUv9h6B2GijDaoqwXiR9Xxb0qH7sfT
 ngTJI3WUi6_nndKbsucmZIhg_g69tKK0_MTwTjWcOeJ9.635YPzoWIFyhMeFNYHj9wx3IRNHSF0.
 .NCAxAdfE_qUlD3PLCGoTrJsw7rQiMwPZauPAZKscbJ_1ut62GMLWVE47zCX5lE.YEHbQeFhObcO
 r4ngMduoyPl2ae3EIwc8THAl5hpAWok0RSgx1twCe7Jq5UE.GNy5R_P75dR3ibWUZWokjIG3B9Ug
 KVPvkk5eMyc5L3.UFCe146IsXXKK0DmirduOdDEz7Y9XID0P_lb4BFfNQ8tnZJfy2zOnlYMgvQiW
 YQaFgP4D6UqBps7lxgb1EjV5fIgANCgFTnylnxwG7t0AWsUOfAUXzQCs0b6A4a80urkzBZVVrywz
 xFDGQjrepUWEaWGbk_YDr9Al9gB381AP_U8M.e8cWaD3uHecYuETaSyd7letVc4jmn39bE44ZxZ9
 z4XLzDB7TqAZApMVlGwPV9VvZM9jFD307DJafw9MrDvnN.HTM4G_VHXUKKg6E1tdSH4MMkUmWYd_
 Rz5aiGnxG0T6d6pNXgUtztjrV47a.bwhvfY3RcXZBH_8SygPo1xWQy8hOWIFu7FQQrVzJ3M1k4uA
 O93JAMJX6Yc3xXkvDVt5YqSLVhfngTgSW1zhZgtzl2mqjEWtFSCUnpXV8EEs9JIZH3XtlTYV_1RB
 r91rH1xWR_z.WFpGmGs9JFumVyCzFea0mL2bWogf5y.3uOMAqGMtbE9bcSn7uNA6Gdc2GItzaGmD
 cAqKtS.mjreWbkfgJzIPWOSXuTmjNlMrh85X_E6SFO1l7FQpCvpJnqStpzp5suaCjPqgyCTRFUQK
 dm5w.dS20UvePQdu6y33EYzqGwRPyI7Fi9PeRLCCo8dggQFBmILb1wZ0Rk2u_vyinTiSni.1jr8.
 AZkiWvbkgQa0MudGq7vRo1QCBUc49MdbyfxDu7WW8zGvhnaAy9SNbzqUaguFTBKXFkNXoDb9tmzO
 uu5t9WJWp4ExShP_w82p.dujoH7oj1UiqWXWG0WuzgvN4PAxNgWTAQMgJamjsFQUUp6ZYybP7Hxd
 KNsCuNBBVhrZV35gSG5YWYn5MUSBWjTN_KXBRayqNiZZwYRYgGHXoaKibTf6xNq7WouevMG7aGUt
 nHK4Z7wmYYifeTEmv7gdLB4jkdtPU0JVWPm90Io3DnojZlRnUTT3Z7urm5JLrwdnAOKBQyv05egL
 CLS8V3XaqkIjQ1_AYcbprWmbkV9LbiMEHDBmsBWgidxr_vHvc8L_NduHAiywUNINnwHhQoPbhxAl
 AQjxiptCXuBdXTyDiIN2tVn1PEVjuyTIxMlv_BBafV4NIy8a0JyJl1ytwEnLg4FemSVqUHoWp5Ki
 1d8.S2TiGCNrCIxeQunWGW.QdcwPlM.Oj70bJaj2FPhx9Y3H4a8TNqESNmd.n9msCHfxRpZitNvl
 TFiDhIQw87r1_xX5EH2_ypAFwvVI1rK.iWa5qAljwNmbfu_VRVXb1nR7wER_iF8RZFEpM8bsZ2H.
 7Dfg9qniZqR_WVJLnM4vJBD7QhgYlWfCm8x_Q.OtXoZIquh1DS_Bci3UYZp6HFOFfyjEaSVM2pAh
 r8lQdawRTwsG6RH90iENiVc7Stz_7JPhXApgsQIywMwU.Wdu_WV.xKAF0chVcDTWBvxRbp6IDGoS
 9Uh4UvSICLpKhsIT_FBrboQ--
X-Sonic-MF: <fransmeulenbroeks@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 9 Mar 2021 15:23:12 +0000
Date: Tue, 9 Mar 2021 15:23:06 +0000 (UTC)
From: "Frans Meulenbroeks" <fransmeulenbroeks@yahoo.com>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <1398197321.1706949.1615303386483@mail.yahoo.com>
In-Reply-To: <71abca0e-fcf6-ecc3-ed79-d2269364884b@gmail.com>
References: <20210308193028.34418-1-raj.khem@gmail.com> <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com> <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com> <CAJ86T=UbEJ730gFbj=WtrGUO2=6+bbgHpuxcuSChV6uGxve3-Q@mail.gmail.com> <71abca0e-fcf6-ecc3-ed79-d2269364884b@gmail.com>
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
MIME-Version: 1.0
X-Mailer: WebService/1.1.17872 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1706948_1424757052.1615303386482"

------=_Part_1706948_1424757052.1615303386482
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Freaking yahoo email seems to have no option any more to quote decently.Gu=
ess it is time for a new email provider :-)Anyway my response below prefixe=
d with FM:

    Op dinsdag 9 maart 2021 00:26:05 CET schreef Khem Raj <raj.khem@gmail.c=
om>: =20
=20
=20

On 3/8/21 2:25 PM, Andre McCurdy wrote:
> On Mon, Mar 8, 2021 at 2:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On 3/8/21 2:11 PM, Andre McCurdy wrote:
>>> On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
>>>>
>>>> resolvconf uses flock and readlink.
>>>> So explicitly added dependencies on util-linux (for flock) and coreuti=
ls
>>>> (for readlink).
>>>> Note that the options used with flock and readlink are not part of the
>>>> busybox implementations so full-fledged implementations are needed.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>=C2=A0 =C2=A0 meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb |=
 2 +-
>>>>=C2=A0 =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b=
/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> index 6df96b699c..6da8cd6023 100644
>>>> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
>>>> @@ -9,7 +9,7 @@ LICENSE =3D "GPLv2+"
>>>>=C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173=
f4504b2cbd8991e50b"
>>>>=C2=A0 =C2=A0 AUTHOR =3D "Thomas Hood"
>>>>=C2=A0 =C2=A0 HOMEPAGE =3D "http://packages.debian.org/resolvconf"
>>>> -RDEPENDS_${PN} =3D "bash"
>>>> +RDEPENDS_${PN} =3D "bash coreutils util-linux"
>>>
>>> util-linux-flock has its own package.
>>
>> yeah and busybox also provides flock too. Lets drop it
>=20
> Busybox provides flock, but it doesn't support the -w option (wait
> with timeout). Either the util-linux flock is required or resolvconf
> needs to be patched to drop the -w option.
>=20

right, its to explore possibilities to avoid the deps.
FM: While I am all in favor of avoiding these dependencies, I'm not versed =
enough in the resolvconf code to judge the impact of dropping -w, so my pre=
ference would be to depend on util-linux-flock.


>>> Patching resolvconf to use readlink -f (instead of readlink -m) should
>>> be sufficient to allow it to work with busybox readlink.
FM: this will most likely work. I can make a patch for that, no problem.
>>>
>>>>=C2=A0 =C2=A0 SRC_URI =3D "git://salsa.debian.org/debian/resolvconf.git=
;protocol=3Dhttps;branch=3Dunstable \
>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-path-for-bu=
sybox.patch \
>>>> --
>>>> 2.30.1

On a general note: in the current form the package is broken, so some fix i=
s desirable.=20

Kind regards, Frans.
 =20

------=_Part_1706948_1424757052.1615303386482
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp23554bbayahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Freaking yahoo email seems t=
o have no option any more to quote decently.</div><div dir=3D"ltr" data-set=
dir=3D"false">Guess it is time for a new email provider :-)</div><div dir=
=3D"ltr" data-setdir=3D"false">Anyway my response below prefixed with FM:<b=
r></div><div><br></div>
       =20
        </div><div id=3D"ydp5fdada19yahoo_quoted_5484965434" class=3D"ydp5f=
dada19yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    Op dinsdag 9 maart 2021 00:26:05 CET schreef Khem Raj &=
lt;raj.khem@gmail.com&gt;:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr"><br clear=3D"none"><br clear=3D"none"=
>On 3/8/21 2:25 PM, Andre McCurdy wrote:<br clear=3D"none">&gt; On Mon, Mar=
 8, 2021 at 2:15 PM Khem Raj &lt;<a shape=3D"rect" href=3D"mailto:raj.khem@=
gmail.com" rel=3D"nofollow" target=3D"_blank">raj.khem@gmail.com</a>&gt; wr=
ote:<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; On 3/8/21 2:11 P=
M, Andre McCurdy wrote:<br clear=3D"none">&gt;&gt;&gt; On Mon, Mar 8, 2021 =
at 11:30 AM Khem Raj &lt;<a shape=3D"rect" href=3D"mailto:raj.khem@gmail.co=
m" rel=3D"nofollow" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br =
clear=3D"none">&gt;&gt;&gt;&gt;<br clear=3D"none">&gt;&gt;&gt;&gt; From: Fr=
ans Meulenbroeks &lt;<a shape=3D"rect" href=3D"mailto:fransmeulenbroeks@yah=
oo.com" rel=3D"nofollow" target=3D"_blank">fransmeulenbroeks@yahoo.com</a>&=
gt;<br clear=3D"none">&gt;&gt;&gt;&gt;<br clear=3D"none">&gt;&gt;&gt;&gt; r=
esolvconf uses flock and readlink.<br clear=3D"none">&gt;&gt;&gt;&gt; So ex=
plicitly added dependencies on util-linux (for flock) and coreutils<br clea=
r=3D"none">&gt;&gt;&gt;&gt; (for readlink).<br clear=3D"none">&gt;&gt;&gt;&=
gt; Note that the options used with flock and readlink are not part of the<=
br clear=3D"none">&gt;&gt;&gt;&gt; busybox implementations so full-fledged =
implementations are needed.<br clear=3D"none">&gt;&gt;&gt;&gt;<br clear=3D"=
none">&gt;&gt;&gt;&gt; Signed-off-by: Khem Raj &lt;<a shape=3D"rect" href=
=3D"mailto:raj.khem@gmail.com" rel=3D"nofollow" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;<br clear=3D"none">&gt;&gt;&gt;&gt; ---<br clear=3D"none">=
&gt;&gt;&gt;&gt;&nbsp; &nbsp; meta/recipes-connectivity/resolvconf/resolvco=
nf_1.87.bb | 2 +-<br clear=3D"none">&gt;&gt;&gt;&gt;&nbsp; &nbsp; 1 file ch=
anged, 1 insertion(+), 1 deletion(-)<br clear=3D"none">&gt;&gt;&gt;&gt;<br =
clear=3D"none">&gt;&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/reso=
lvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf=
_1.87.bb<br clear=3D"none">&gt;&gt;&gt;&gt; index 6df96b699c..6da8cd6023 10=
0644<br clear=3D"none">&gt;&gt;&gt;&gt; --- a/meta/recipes-connectivity/res=
olvconf/resolvconf_1.87.bb<br clear=3D"none">&gt;&gt;&gt;&gt; +++ b/meta/re=
cipes-connectivity/resolvconf/resolvconf_1.87.bb<br clear=3D"none">&gt;&gt;=
&gt;&gt; @@ -9,7 +9,7 @@ LICENSE =3D "GPLv2+"<br clear=3D"none">&gt;&gt;&gt=
;&gt;&nbsp; &nbsp; LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd317=
3f4504b2cbd8991e50b"<br clear=3D"none">&gt;&gt;&gt;&gt;&nbsp; &nbsp; AUTHOR=
 =3D "Thomas Hood"<br clear=3D"none">&gt;&gt;&gt;&gt;&nbsp; &nbsp; HOMEPAGE=
 =3D "<a shape=3D"rect" href=3D"http://packages.debian.org/resolvconf" rel=
=3D"nofollow" target=3D"_blank">http://packages.debian.org/resolvconf</a>"<=
br clear=3D"none">&gt;&gt;&gt;&gt; -RDEPENDS_${PN} =3D "bash"<br clear=3D"n=
one">&gt;&gt;&gt;&gt; +RDEPENDS_${PN} =3D "bash coreutils util-linux"<br cl=
ear=3D"none">&gt;&gt;&gt;<br clear=3D"none">&gt;&gt;&gt; util-linux-flock h=
as its own package.<br clear=3D"none">&gt;&gt;<br clear=3D"none">&gt;&gt; y=
eah and busybox also provides flock too. Lets drop it<br clear=3D"none">&gt=
; <br clear=3D"none">&gt; Busybox provides flock, but it doesn't support th=
e -w option (wait<br clear=3D"none">&gt; with timeout). Either the util-lin=
ux flock is required or resolvconf<br clear=3D"none">&gt; needs to be patch=
ed to drop the -w option.<br clear=3D"none">&gt; <br clear=3D"none"><br cle=
ar=3D"none"><div>right, its to explore possibilities to avoid the deps.</di=
v><div><br></div><div dir=3D"ltr" data-setdir=3D"false">FM: While I am all =
in favor of avoiding these dependencies, I'm not versed enough in the resol=
vconf code to judge the impact of dropping -w, so my preference would be to=
 depend on util-linux-flock.<br></div><div class=3D"ydp5fdada19yqt703819592=
4" id=3D"ydp5fdada19yqtfd48589"><br clear=3D"none"><br clear=3D"none">&gt;&=
gt;&gt; Patching resolvconf to use readlink -f (instead of readlink -m) sho=
uld<br clear=3D"none"><div>&gt;&gt;&gt; be sufficient to allow it to work w=
ith busybox readlink.</div><div><br></div><div dir=3D"ltr" data-setdir=3D"f=
alse">FM: this will most likely work. I can make a patch for that, no probl=
em.<br></div>&gt;&gt;&gt;<br clear=3D"none">&gt;&gt;&gt;&gt;&nbsp; &nbsp; S=
RC_URI =3D "git://salsa.debian.org/debian/resolvconf.git;protocol=3Dhttps;b=
ranch=3Dunstable \<br clear=3D"none">&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;  file://fix-path-for-busybox.patch \<br clear=3D=
"none">&gt;&gt;&gt;&gt; --<br clear=3D"none">&gt;&gt;&gt;&gt; 2.30.1<br cle=
ar=3D"none"><div><br></div><div>On a general note: in the current form the =
package is broken, so some fix is desirable. <br></div><div><br></div><div =
dir=3D"ltr" data-setdir=3D"false">Kind regards, Frans.<br></div></div></div=
></div>
            </div>
        </div></body></html>

------=_Part_1706948_1424757052.1615303386482--
