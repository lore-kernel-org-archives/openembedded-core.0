Received: from outbound.mr.icloud.com (outbound.mr.icloud.com [57.103.69.143])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.637.1793036966990808422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 10:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@subset.ch header.s=sig1 header.b=EmQj4WEG;
 spf=pass (domain: subset.ch, ip: 57.103.69.143, mailfrom: patrick@subset.ch)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPS id C235D18001A2;
	Mon, 26 Oct 2026 17:49:23 +0000 (UTC)
X-ICL-RepId: 01a17954-ceb5-75cc-aeed-76eb0645b3f2
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhICkMFWwBeC0kEQwVYEhVdRUMMQxlbE1I4QBhVGFcEFxtbTVEPDwNMGkAIQ0VRGBkKUFAES1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKGEcSSh1HQ1QDEh1QHA5RU1sCFl8bUFUaW1ZEC1UHWQRSH0gKTwRAU1wKRgkZAQ5TX1MVeRVWQ1QEX04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1; t=1793036966; x=1824572966; bh=BgwedlhOr7ILXDCU0WrMwBXXYeb30t0UxqBucAWWfog=; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:x-icloud-hme; b=EmQj4WEGJv31N1puFE+ksFrHU9wR2xllKDuaJPPMHHFz4Yn8gEXXvWsN/PithcYy2FzWOzzCAWw932cA5YDABUt24S4DNU/tcqPYAfFe6oEpnAodbY5zgWmoPo3H8bwHi/KY6zvyia7ECynmfDIKCW+p9S4AaNVRB2DDgkcrRjVf8WDYEUOiPc9w50fjyjx6D0eV55Sq0Czv+2kkaF9ueQyRDZCOgKxwzVZCmpojucTSBNf7Jd8qZOIqYzDFuRBHai21g/W/L/cqpQigLUJB7F5M8f74De4SG0h/hHy9ZDiAtyS1QSeJb3x7depurOtIftQtjBTrgZ2hzxSdABpiIw==
mail-alias-created-date: 1663698038540
Received: from p00-mailws2-7586f5b675-dsbc2 (unknown [100.81.44.153])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPSA id B856B18001A4;
	Mon, 26 Oct 2026 17:49:22 +0000 (UTC)
Date: Mon, 26 Oct 2026 17:49:22 +0000 (GMT)
From: Patrick Wicki <patrick@subset.ch>
To: "Patrick Wicki via lists.openembedded.org"
 <patrick.wicki=subset.ch@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Message-ID: <d00ffcc8-0d42-4439-8377-d7860a2cd4ae@me.com>
In-Reply-To: <18E224D844B0E607.189163@lists.openembedded.org>
References: <18E224D844B0E607.189163@lists.openembedded.org>
Subject: Re: [OE-core] [meta-networking][PATCH 1/2] squid: install systemd
 unit without executable bit
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary=Apple-Webmail-42--8843be94-259a-4516-92be-627f7869dad4
X-Mailer: iCloud MailClient2638Hotfix77 MailServer2644B3
X-Proofpoint-ORIG-GUID: NpKFTp17mcN52RiWe2e9Aqgwppf2bYxD
X-Proofpoint-GUID: NpKFTp17mcN52RiWe2e9Aqgwppf2bYxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3MSBTYWx0ZWRfX9uJvP+bJkeGB
 VrQXvIKcqGcK+qord2HckeKEg1FbHcqkeboKlFPcC9e6MegEWUvgJW0rAgF29DbHNnK7gJduHzW
 1gaB9zi3wqbaKEaWlaJk6y0wcyaeBLS/kCeyFl9O45ffIeLFxs/NNlWPoKSiu1+5h/jbbhf1Enb
 ePXthHEawKWR3E9UphOnH2SJlXD4mOY21zrDlDBTTHAbffariPkjWIzH4TBZq0GMgYGVJyUmX5s
 b+DbnLjXtBetpxeMMQo65mkIf+u4AL/8KlgCwIZ2/VVsmv66IppG8oSkqN8gO0bIiYf4C5iRLEX
 EqGoJp5+IYa/hbHytzhL/nlByoBxJVkAGN7vHRDFm5aiC3lrtTOF1GGOFaVWEQ=
X-Authority-Info-Out: v=2.4 cv=NaDrFmD4 c=1 sm=1 tr=0 ts=6adf92a4
 cx=c_apl:c_pps:t_out a=VIBvfxVZLSH+SK6saaFYJA==:117 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8
 a=ELV1fP3CWamd1OTT-KQA:9 a=QEXdDO2ut3YA:10 a=gj6WHEeAYbKuOztst_QA:9
 a=P3woexyFa1R-iTGl:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=s5zKW874KtQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-JNJ: AAAAAAABPv9eSDEVeANOY8chPCujEzgeP1w/SgJYyNtDGnAsIZu+CTau0Dkgw3Ab3xC64psiyoPdc+4+PmM2inLxUDN+LecZ37+81wQlGTqrHZBwaj2MzQQQ/pNBpVkpEfrWXHbjHyQxTdQ+nj5JzEC4Wy/kyW5cEEuAfR1hQnJsSCHDj4e+yl38h86Bp5/nScDwcK87ixcSZYY2Hnee6iSGdyDd4Z7fknGxGdwfSMJdo8SsRazSDQdjoEoApsYpMXA//TdqQK1Oym3VRmZqRz5+yTAf+7eq/fgRK9mwOJ3/h+H0Y9MijPDFbL5N4EmGPAlSa+bcLdLZQGGqjs4zrkCWKFMVTT6CeeaXoF8nu/DBA+yHow4xSAFlMl1TpN6EyXD/WygHyzKcUjc0dFCUqfhXl6d7IXJGpMu4bWFhu9eHo9drbIJONWe2EplOkjU56ZfHVmMkuMROR+xgHYC20fnnaxjWm3/QpZOQyQElqVvd7K+rYfvgJPKplbv2pz4uMVuYnhaPk5NRH6/dc4KQpqK7TObw+37JqUjPOGK9T29q83rreUhrdY3KB5IHXQS274f5ywcmnpvZobKnfWceQeS3rTbQvaksS8rU0Z2HWPxGdwmJbFNb7DDAjD1+6GOrtx3n5RbbKX74XVCOdppJyet5t5J8sPZVbJebwmf8RtBPRCSsXn/8/ifIg/kxxENb/vKC2j7jk6hMo3TiDlfnBYB0+CBUiWRPsb4Imcno0s+NsPpG5s2ghy4Y1tq6DFZxOQ7Iw2zvOI1p4H9xqPw4TLNg2GxwkVqsv4RBx/qemHKSEJmCJ1uNFYaDE8up6W/dTxnO3LOaegbuqgI5QXap1XRCbl9NQe6gqJx0rI6TNqIo2RTsf3YrnxAMgOmOC3/4dHWxwEcrFW9QgRKub3kcKbxw/076g1gpMAIYWV2Xz2Ol5Nh9Sk6aVodDhBLooP9POcaRc6HU/MRiyvLDCcJiVn6bZOOANeY
 +q0SEo5nJq0dsGB/U1h3XjA4kqOwjYD3h2uJtke+xz5nZ4sUhqeNXkLgvsWOiasv/ARQIOJYmm3V6P9Subd5+A4uH7e+cAQYS9Dh1pKpMhgBJr0sG3a41bziPnIsH03oLnQLRsQw5PebmKgD2N2RkFUK+B66itwZNObO2ZXs2GxHdPFQwgBE87U8OE7YyotOd21vW3naWtL1hU2Zs4sUWAhQtHlhBSeZmRYXQd4ECnRUMmps3zmXv65/g0vJclMsyRBxrppLVwEWfMFagts0iNbgVw0WQLnxZYksmMtzOP4La+Q+HTnRMgwTO6LH82CT6SHhpJ1xxHc2ANOya7pI3V320K96cw/hWi4TuTReLT3sQG3Ci9IRDL3sfQl8qOzQ+YZsddJ2FjChAjY6JmwtkuRSgVvpiDhbUpZ3uyEiYeV5NwWD0RXbbf/l0cm/cOt04
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 17:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248691

--Apple-Webmail-42--8843be94-259a-4516-92be-627f7869dad4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Please ignore. Sent to the wrong list by accident. On Oct 26, 2026, at 6:35=
 PM, Patrick Wicki via lists.openembedded.org <patrick.wicki=3Dsubset.ch@li=
sts.openembedded.org> wrote: From: Patrick Wicki <patrick.wicki@siemens.com=
> install defaults to mode 0755, which makes systemd complain: Configuratio=
n file /usr/lib/systemd/system/squid.service is marked executable. Please r=
emove executable permission bits. Proceeding anyway. Signed-off-by: Patrick=
 Wicki <patrick.wicki@siemens.com> --- meta-networking/recipes-daemons/squi=
d/squid_7.7.bb | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --=
git a/meta-networking/recipes-daemons/squid/squid_7.7.bb b/meta-networking/=
recipes-daemons/squid/squid_7.7.bb index b657197fd7..bda8f124cb 100644 --- =
a/meta-networking/recipes-daemons/squid/squid_7.7.bb +++ b/meta-networking/=
recipes-daemons/squid/squid_7.7.bb @@ -117,7 +117,7 @@ do_install:append() =
{ if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then # Install service unit file install -d ${D}/${systemd_unitdir}/syst=
em - install ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir}/syste=
m + install -m 0644 ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir=
}/system sed -i ' s:/var/run/:/run/:g ' ${D}/${systemd_unitdir}/system/squi=
d.service # Configure tmpfiles.d -- 2.56.0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D- Links: You receive all messages sent to this group. View/Repl=
y Online (#248687): https://lists.openembedded.org/g/openembedded-core/mess=
age/248687 Mute This Topic: https://lists.openembedded.org/mt/121946510/800=
9873 Group Owner: openembedded-core+owner@lists.openembedded.org Unsubscrib=
e: https://lists.openembedded.org/g/openembedded-core/unsub [patrick.wicki@=
subset.ch] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
--Apple-Webmail-42--8843be94-259a-4516-92be-627f7869dad4
Content-Type: multipart/related; type="text/html"; boundary=Apple-Webmail-86--8843be94-259a-4516-92be-627f7869dad4

--Apple-Webmail-86--8843be94-259a-4516-92be-627f7869dad4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div><div>Please ignore. Sent to the wrong list by accident.</d=
iv><div><br></div><blockquote type=3D"cite"><div>On Oct 26, 2026, at 6:35 P=
M, Patrick Wicki via lists.openembedded.org &lt;patrick.wicki=3Dsubset.ch@l=
ists.openembedded.org&gt; wrote:</div><div><br></div><div><br></div><div><d=
iv><div>From: Patrick Wicki &lt;patrick.wicki@siemens.com&gt;</div><div><br=
></div><div>install defaults to mode 0755, which makes systemd complain:</d=
iv><div><br></div><div> Configuration file /usr/lib/systemd/system/squid.se=
rvice is marked</div><div> executable. Please remove executable permission =
bits. Proceeding anyway.</div><div><br></div><div>Signed-off-by: Patrick Wi=
cki &lt;patrick.wicki@siemens.com&gt;</div><div>---</div><div>meta-networki=
ng/recipes-daemons/squid/squid_7.7.bb | 2 +-</div><div>1 file changed, 1 in=
sertion(+), 1 deletion(-)</div><div><br></div><div>diff --git a/meta-networ=
king/recipes-daemons/squid/squid_7.7.bb b/meta-networking/recipes-daemons/s=
quid/squid_7.7.bb</div><div>index b657197fd7..bda8f124cb 100644</div><div>-=
-- a/meta-networking/recipes-daemons/squid/squid_7.7.bb</div><div>+++ b/met=
a-networking/recipes-daemons/squid/squid_7.7.bb</div><div>@@ -117,7 +117,7 =
@@ do_install:append() {</div><div> if ${@bb.utils.contains('DISTRO_FEATURE=
S', 'systemd', 'true', 'false', d)}; then</div><div> # Install service unit=
 file</div><div> install -d ${D}/${systemd_unitdir}/system</div><div>-     =
   install ${S}/tools/systemd/squid.service ${D}/${systemd_unitdir}/system<=
/div><div>+        install -m 0644 ${S}/tools/systemd/squid.service ${D}/${=
systemd_unitdir}/system</div><div> sed -i '<a href=3D"http://s:/var/run/:/r=
un/:g" rel=3D"noopener noreferrer">s:/var/run/:/run/:g</a>' ${D}/${systemd_=
unitdir}/system/squid.service</div><div><br></div><div> # Configure tmpfile=
s.d</div><div>-- </div><div>2.56.0</div></div><div><div><br></div><div>-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</div><div>Links: You receive all =
messages sent to this group.</div><div>View/Reply Online (#248687): <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/248687" rel=
=3D"noopener noreferrer">https://lists.openembedded.org/g/openembedded-core=
/message/248687</a></div><div>Mute This Topic: <a href=3D"https://lists.ope=
nembedded.org/mt/121946510/8009873" rel=3D"noopener noreferrer">https://lis=
ts.openembedded.org/mt/121946510/8009873</a></div><div>Group Owner: <a href=
=3D"mailto:openembedded-core+owner@lists.openembedded.org">openembedded-cor=
e+owner@lists.openembedded.org</a></div><div>Unsubscribe: <a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/unsub" rel=3D"noopener norefer=
rer">https://lists.openembedded.org/g/openembedded-core/unsub</a> [patrick.=
wicki@subset.ch]</div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</d=
iv></div></div></blockquote></div><div><br></div></body></html>
--Apple-Webmail-86--8843be94-259a-4516-92be-627f7869dad4--

--Apple-Webmail-42--8843be94-259a-4516-92be-627f7869dad4--

