Return-Path: <elena.reshetova@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9588A77045
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 17:03:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 10:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; 
	d="p7s'?scan'208,217";a="638637601"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
	by orsmga003.jf.intel.com with ESMTP; 04 Sep 2015 10:03:28 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.81]) by
	irsmsx105.ger.corp.intel.com ([169.254.7.51]) with mapi id
	14.03.0224.002; Fri, 4 Sep 2015 18:03:27 +0100
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] How to put a correct dependency with regards to gcc?
Thread-Index: AdDnMqsfLpontyTuT+6uqwUhUC+6ZA==
Date: Fri, 4 Sep 2015 17:03:26 +0000
Message-ID: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Fri, 04 Sep 2015 17:03:29 -0000
X-Groupsio-MsgNum: 70693
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0019_01D0E6F8.EFE6C2A0"

------=_NextPart_000_0019_01D0E6F8.EFE6C2A0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_001A_01D0E6F8.EFE6E9B0"

------=_NextPart_001_001A_01D0E6F8.EFE6E9B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I have a simple problem but not able to come with simple and elegant
solution for it, so would be very thankful for the suggestions. 

 

I have a task that is specified to run after do_fetch. The task needs the
source to be *actually* fetched, since it operates on archives. It works
well for everything apart gcc. 

For example in fido branch, my task run for libgcc will fail, because
do_fetch task for libgcc actually *does not* not fetch the gcc sources (only
puts a nice lock file in the download folder).

 

When I noticed this, I tried to put the dependency on gcc-source:do_fetch
for my task (because that actually fetches the gcc sources) and it works in
fido, but in master after changes to gcc nothing provides gcc-source and it
wants to specify the version, which I don't want to do (ideally I don't want
to put any dependencies to gcc, since I don't really depend on it!). In
master a run for libgcc-initial fails for the same reasons: gcc tar ball is
not there. 

 

Is there a way to make it work correctly? 

 

Here is the history of issue we are trying to solve:
https://github.com/01org/meta-security-isafw/issues/1

 

Best Regards,
Elena.


------=_NextPart_001_001A_01D0E6F8.EFE6E9B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFI =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-GB>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I have a simple problem but not =
able to come with simple and elegant solution for it, so would be very =
thankful for the suggestions. <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I have a task that is specified to =
run after do_fetch. The task needs the source to be *<b>actually</b>* =
fetched, since it operates on archives. It works well for everything =
apart gcc. <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>For example in fido branch, my task run for libgcc will =
fail, because do_fetch task for libgcc actually *<b>does not</b>* not =
fetch the gcc sources (only puts a nice lock file in the download =
folder).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>When I noticed this, I tried to put the dependency on =
gcc-source:do_fetch for my task (because that actually fetches the gcc =
sources) and it works in fido, but in master after changes to gcc =
nothing provides gcc-source and it wants to specify the version, which I =
don&#8217;t want to do (ideally I don&#8217;t want to put any =
dependencies to gcc, since I don&#8217;t really depend on it!). In =
master a run for libgcc-initial fails for the same reasons: gcc tar ball =
is not there. <o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Is there a way to make it work correctly? =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Here is the history of issue we are trying to solve: <a =
href=3D"https://github.com/01org/meta-security-isafw/issues/1">https://gi=
thub.com/01org/meta-security-isafw/issues/1</a><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Best =
Regards,<br>Elena.<o:p></o:p></span></p></div></body></html>

------=_NextPart_001_001A_01D0E6F8.EFE6E9B0--

------=_NextPart_000_0019_01D0E6F8.EFE6C2A0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
VMv3yxHO8jex40LgMIIFgjCCBGqgAwIBAgITMwAAD3rg031j5++L1QAAAAAPejANBgkqhkiG9w0B
AQUFADB5MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJhMRow
GAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMg
SXNzdWluZyBDQSA0QjAeFw0xNTAyMTIyMzMzMTJaFw0xODAxMjcyMzMzMTJaMEUxGTAXBgNVBAMT
EFJlc2hldG92YSwgRWxlbmExKDAmBgkqhkiG9w0BCQEWGWVsZW5hLnJlc2hldG92YUBpbnRlbC5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC8zCTf8cWZZUKtxwMUvSAnw+W43aFU
UojRptAkTEnxL7PPHdqDP9F4q/6oIcHWhlxca0/lopd2l7h1bzb8bRdTWJwQ9Hf67xLNnhRW5Xtu
A6RW88jOU4ALNkktravhIfru5oQ9SatQOJlkRpZWid5ByI4qUe/G3PmCMdOAHFfUQDZ+CpwexUYJ
FUvDcCVAcqRTx4g/jbhAMfmJQ1RnFXj5Wxq3H0PrH7Tsb9bqXSWGxE6Vr5VQI776dWxwWSbu82CF
uUY2j6Qq902bui4Wg0pRUlG66wFbQ9YujkrrhPSScCWOkycSVUy1tguk5L1WHtj2DelrG5We/Z7T
z3IaYQsTAgMBAAGjggI1MIICMTALBgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGC
NxUIhsOMdYSZ5VGD/YEohY6fU4KRwAlngd69OZXwQwIBZAIBCDAdBgNVHQ4EFgQUojQGvJU2345o
mYdTt1O7CESK1YYwHwYDVR0jBBgwFoAU2kEjnFqPca9Xgz4g0+Nl2wzLC9swZQYDVR0fBF4wXDBa
oFigVoZUaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5h
bCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEIuY3JsMIGfBggrBgEFBQcBAQSBkjCBjzAiBggr
BgEFBQcwAYYWaHR0cDovL29jc3AuaW50ZWwuY29tLzBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5p
bnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2lj
JTIwSXNzdWluZyUyMENBJTIwNEIuY3J0MB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMM
MCkGCSsGAQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBPBgNVHREESDBGoCkG
CisGAQQBgjcUAgOgGwwZZWxlbmEucmVzaGV0b3ZhQGludGVsLmNvbYEZZWxlbmEucmVzaGV0b3Zh
QGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAod197fPvlvz23dBvvgrjTi/LUl8J8o1fmbNG
YjdquDdvPNDJ4FL8t9MpeqRc+63IgyitnmvmiD+lzTibTwDSt2MY9Mck8VJDF60h7dnFFhr3k1B6
yt6cwxvdadOVB0UVwORYw+9LWvnNyhqsMz7YZtEksDkFqtTE7+vZhVDBAjhTTjtMeDz+l9JOWnkx
bJcp/RbxD3m16kRaXq5xHQQ4TfjSRw0GjZq2FafF8yrv+vcVlXYLaKT0DXKT/mCksU7aN4BE5tUx
H55A48baN+GMUI75Gk3rzh/kdNmYtJhYs63kZ8+2u/hkxEc1/wKM5h714s2+dcCznTAuLF6mXVUp
6jCCBckwggSxoAMCAQICEzMAAGceyeUJ4F3k0k4AAAAAZx4wDQYJKoZIhvcNAQEFBQAweTELMAkG
A1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMRSW50
ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0Eg
NEEwHhcNMTUwMjEyMjMzMjMzWhcNMTgwMTI3MjMzMjMzWjBFMRkwFwYDVQQDExBSZXNoZXRvdmEs
IEVsZW5hMSgwJgYJKoZIhvcNAQkBFhllbGVuYS5yZXNoZXRvdmFAaW50ZWwuY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAri/J5YL4ajWEtrCcoBdZhjVXDBMbhSL9Sa+oL2KXVmCc
gNNGSkyw9GS6QnkkJq0i7DQooSuI0ymSvWu4dhotg8SytCXuxMH0Q3WRapVw9K73ZDKz3cbFFeps
FiSAjOZ3qflZt5ZiweR/XJq8PNwgTnvajNdC+jXeEPzJV4vEsaHpBmf1xhx2SqkQhJAlb6sa2dgR
bGMLdMKR9SE+3LVNBVDyx39lSY92S+8W4iRLfLpQiN1k2hL10ubFrOchsKz2tQZt9dc7ekZLgmmy
/rxBFY70hsqjiwA5KVestkdZmUkj5bRwOL0sjOqVJaAoNkrNZGVdzpsuVz7ybt/G9ulDWwIDAQAB
o4ICfDCCAngwCwYDVR0PBAQDAgQwMD0GCSsGAQQBgjcVBwQwMC4GJisGAQQBgjcVCIbDjHWEmeVR
g/2BKIWOn1OCkcAJZ4S52UGHhP9OAgFkAgENMEQGCSqGSIb3DQEJDwQ3MDUwDgYIKoZIhvcNAwIC
AgCAMA4GCCqGSIb3DQMEAgIAgDAHBgUrDgMCBzAKBggqhkiG9w0DBzAdBgNVHQ4EFgQUXy7oFxt5
z1FFlAs9UeyFV0CwbF4wHwYDVR0jBBgwFoAUHmkqtNwo/kcYTiELP7ysES/wmPUwZQYDVR0fBF4w
XDBaoFigVoZUaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRl
cm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3JsMIGfBggrBgEFBQcBAQSBkjCBjzBp
BggrBgEFBQcwAoZdaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMv
SW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEEuY3J0MCIGCCsGAQUF
BzABhhZodHRwOi8vb2NzcC5pbnRlbC5jb20vMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3
CgMEMCkGCSsGAQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDBDBPBgNVHREESDBG
oCkGCisGAQQBgjcUAgOgGwwZZWxlbmEucmVzaGV0b3ZhQGludGVsLmNvbYEZZWxlbmEucmVzaGV0
b3ZhQGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAoQFBFD/YZhrNEYTXYuZkKHYE+KJ5cF4m
bYlT8LAVpVtdWYj3uDWMVX0aJASNa01fZNNp8FVacHQkH6RqMAO9zu8q71Y/fTZLq/wTA5mXyiER
9x+U3BvF/WPfnfzxZ1DlamT6EhkPNpR2zkWxHuI5Wz5H0TGYCcmkTJ+z7ERTBV5RvTMcBRFY4F6I
rLlcj+S616J74ohWv6QK8gZ894Jl/D0XyKYRxEhu5VGwfmRC8fXfCDL9v5zLWEcdjwwhkTGWWNB2
WOJYZCer+SGEGCYldn7YSPDOmlxpd8XlO3M1m1gAfsmnU/AjacOYnKyp/THuGC97/7NcWHfkR9vD
z1fq9jGCA/kwggP1AgEBMIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxML
U2FudGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBF
eHRlcm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCAhMzAAAPeuDTfWPn74vVAAAAAA96MAkGBSsOAwIa
BQCgggI9MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE1MDkwNDE3
MDMyNFowIwYJKoZIhvcNAQkEMRYEFCJbmuc1uss94Booj9om5ETRNDKXMIGTBgkqhkiG9w0BCQ8x
gYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIaMAsGCWCGSAFlAwQCAzALBglg
hkgBZQMEAgIwCwYJYIZIAWUDBAIBMIGhBgkrBgEEAYI3EAQxgZMwgZAweTELMAkGA1UEBhMCVVMx
CzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMRSW50ZWwgQ29ycG9y
YXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgNEECEzMAAGce
yeUJ4F3k0k4AAAAAZx4wgaMGCyqGSIb3DQEJEAILMYGToIGQMHkxCzAJBgNVBAYTAlVTMQswCQYD
VQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9u
MSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBAhMzAABnHsnlCeBd
5NJOAAAAAGceMA0GCSqGSIb3DQEBAQUABIIBAIvf8pJF5JOkZwPMCgXJRIZB4traRRf6QbJU3WV8
jDuopzz0/Qtx6AY0w0yVjh+BaA0L6uoul8GysczMiMrdbdtNwHR0n5Vo8BhP525N58yYj9hFwxSv
RxbJyY4v78oo69hb680ro2l/j+gBywboMXEjfSsWZkI/o6Txt75QaN3nCabC7RsaKAEa7fflH7TR
Aj78/aE4p4aY+EqslrvBQYRdv5nvhfrWyIOSuRUtNRyewz5IJYXdDzSTBEZW2T6nhVCzH9YzG34b
OzJbTm+ivKIex90aGnGlAR+rLbb0XKwor8O+xHGIU5TLS/4PvUlg9Xw299L9Zmc/GSnlYCQTHoAA
AAAAAAA=

------=_NextPart_000_0019_01D0E6F8.EFE6C2A0--
