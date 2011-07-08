Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michaelx.d.halstead@intel.com>) id 1QfJeb-0001jl-Ud
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 00:36:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2011 15:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; 
	d="p7s'?scan'208";a="23385729"
Received: from linux-mkad.jf.intel.com (HELO [10.7.202.54]) ([10.7.202.54])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 15:31:10 -0700
Message-ID: <4E17848D.5090304@intel.com>
Date: Fri, 08 Jul 2011 15:28:29 -0700
From: Michael Halstead <michaelx.d.halstead@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110616 SUSE/3.1.11 Thunderbird/3.1.11
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAOd_LFwKQHF7-wtHPALJhfDZTvWkpWBR_wmgLPAUCRh3Y8-RaA@mail.gmail.com>
	<1310161925.20015.918.camel@rex>
In-Reply-To: <1310161925.20015.918.camel@rex>
X-Mailman-Approved-At: Sat, 09 Jul 2011 10:36:34 +0200
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libmatchbox fetch error
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
X-List-Received-Date: Fri, 08 Jul 2011 22:36:10 -0000
X-Groupsio-MsgNum: 5638
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms080806090704050504000800"

--------------ms080806090704050504000800
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 07/08/2011 02:52 PM, Richard Purdie wrote:
> On Fri, 2011-07-08 at 16:16 -0400, Cliff Brake wrote:
>> I'm trying to get some basic oe-core builds going (core-image-sato)
>> and am running into:
>>
>> ERROR: Logfile of failure stored in:
>> /scratch/oe/openembedded-core/build/tmp-eglibc/work/i586-oe-linux/libm=
atchbox-1.9-r8/temp/log.do_fetch.24235
>> Log data follows:
>> | NOTE: fetch http://projects.o-hand.com/matchbox/sources/libmatchbox/=
1.9/libmatchbox-1.9.tar.gz
>> | ERROR: Function 'Fetcher failure for URL:
>> 'http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchb=
ox-1.9.tar.gz'.
>> Unable to fetch URL
>> http://projects.o-hand.com/matchbox/sources/libmatchbox/1.9/libmatchbo=
x-1.9.tar.gz
>> from any source.' failed
>> NOTE: package libmatchbox-1.9-r8: task do_fetch: Failed
>> ERROR: Task 1884
>> (/scratch/oe/openembedded-core/meta/recipes-graphics/libmatchbox/libma=
tchbox_1.9.bb,
>> do_fetch) failed with exit code '1'
>>
>> It seems like the matchbox site is in flux right now.  Is there a
>> stable place to get the download?
> At the very least the yocto mirrors have those pieces on them. I don't
> know what has happened to those urls but I'll try and find out.
>
> Cheers,
>
> Richard
>
Those files were moved when we converted the matchbox-project site from=20
Wordpress to static HTML for security reasons. The files have been=20
restored. Thank you for bringing this to my attention.

Michael Halstead



--------------ms080806090704050504000800
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIVbDCCAz0w
ggKmoAMCAQICAwWw/zANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJVUzEQMA4GA1UEChMHRXF1
aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2VydGlmaWNhdGUgQXV0aG9yaXR5MB4XDTA2
MDIxNjE4MDEzMFoXDTE2MDIxOTE4MDEzMFowUjELMAkGA1UEBhMCVVMxGjAYBgNVBAoTEUludGVs
IENvcnBvcmF0aW9uMScwJQYDVQQDEx5JbnRlbCBFeHRlcm5hbCBCYXNpYyBQb2xpY3kgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBpd/XOb9QVqEZ8mQ1042TdOIq3ATDIsV2xDyt
30yLyMR5Wjtus0bn3B+he89BiNO/LP6+rFzEwlD55PlX+HLGIKeNNG97dqyc30FElEUjZzTZFq2N
4e3kVJ/XAEEgANzV8v9qp7qWwxugPgfc3z9BkYot+CifozexHLb/hEZj+yISCU61kRZvuSQ0E11y
YL4dRgcglJeaHo3oX57rvIckaLsYV5/1Aj+R8DM1Ppk965XQAKsHfnyT7C4S50T4lVn4lz36wOdN
Zn/zegG1zp41lnoTFfT4KuKVJH5x7YD1p6KbgJCKLovnujGuohquBNfdXKpZkvz6pGv+iC1HawJd
AgMBAAGjgaAwgZ0wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBQaxgxKxEdvqNutK/D0Vgaj7TdU
DDA6BgNVHR8EMzAxMC+gLaArhilodHRwOi8vY3JsLmdlb3RydXN0LmNvbS9jcmxzL3NlY3VyZWNh
LmNybDAfBgNVHSMEGDAWgBRI5mj5K9KylddH2CMgEE8zmJCf1DAPBgNVHRMBAf8EBTADAQH/MA0G
CSqGSIb3DQEBBQUAA4GBABMQOK2kVKVIlUWwLTdywJ+e2O+PC/uQltK2F3lRyrPfBn69tOkIP4Sg
DJOfsxyobIrPLe75kBLw+Dom13OBDp/EMZJZ1CglQfVV8co9mT3aZMjSGGQiMgkJLR3jMfr900fX
ZKj5XeqCJ+JP0mEhJGEdVCY+FFlksJjV86fDrq1QMIIFijCCBHKgAwIBAgIKYSCKYgAAAAAACDAN
BgkqhkiG9w0BAQUFADBSMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24x
JzAlBgNVBAMTHkludGVsIEV4dGVybmFsIEJhc2ljIFBvbGljeSBDQTAeFw0wOTA1MTUxOTI3MjZa
Fw0xNTA1MTUxOTM3MjZaMFYxCzAJBgNVBAYTAlVTMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlv
bjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSAzQjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKQEM1Wn9TU9vc9C+/Tc7KB+eiYElmrcEWE32WUdHvWG+IcQ
HVQsikTmMyKKojNLw2B5s6Iekc8ivDo/wCfjZzX9JyftMnc+AArc0la87Olybzm8K9jXEfTBvTnU
SFSiI9ZYefITdiUgqlAFuljFZEHYKYtLuhrRacpmQfP4mV63NKdc2bT804HRf6YptZFa4k6YN94z
lrGNrBuQQ74WFzz/jLBusbUpEkro6Mu/ZYFOFWQrV9lBhF9Ruk8yN+3N6n9fUo/qBigiF2kEn9xV
h1ykl7SCGL2jBUkXx4qgV27a6Si8lRRdgrHGtN/HWnSWlLXTH5l575H4Lq++77OFv38CAwEAAaOC
AlwwggJYMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFA7GKvdZsggQkCVvw939imYxMCvFMAsG
A1UdDwQEAwIBhjASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQ5oFY2ekKQ/5Kt
im+VdMeSWb4QWTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAfBgNVHSMEGDAWgBQaxgxKxEdv
qNutK/D0Vgaj7TdUDDCBvQYDVR0fBIG1MIGyMIGvoIGsoIGphk5odHRwOi8vd3d3LmludGVsLmNv
bS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBQb2xpY3klMjBDQS5j
cmyGV2h0dHA6Ly9jZXJ0aWZpY2F0ZXMuaW50ZWwuY29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIw
RXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNybDCB4wYIKwYBBQUHAQEEgdYwgdMwYwYI
KwYBBQUHMAKGV2h0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0lu
dGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNydDBsBggrBgEFBQcwAoZgaHR0
cDovL2NlcnRpZmljYXRlcy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwl
MjBFeHRlcm5hbCUyMEJhc2ljJTIwUG9saWN5JTIwQ0EuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQCx
tQEHchVQhXyjEqtMVUMe6gkmPsIczHxSeqNbo9dsD+6xbT65JT+oYgpIAtfEsYXeUJu1cChqpb22
U5bMAz7eaQcW5bzefufWvA6lg2048B8oczBj/q+5P5NpYrUO8jOmN4jTjfJq3ElZ7yFWpy7rB3Vm
/aN6ATYqWfMbS/xfh+JCxmH3droUmMJI0/aZJHsLtjbjFnNsHDNrJZX1vxlM78Lb1hjskTENPmhb
VbfTj5i/ZGnhv4tmI8QZPCNtcegXJrfhRl2D9bWpdTOPrWiLDUqzy1Z6KL7TcOS/PCl8RHCJXkPa
u/thTQCpIoDa2+c+3XA++gRTfAQ4svTO260NMIIGJzCCBQ+gAwIBAgIKYcadtAABAABwZDANBgkq
hkiG9w0BAQUFADBWMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzAp
BgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgM0IwHhcNMTEwNjE2MjEyNDU2
WhcNMTQwNTMxMjEyNDU2WjBNMR0wGwYDVQQDExRIYWxzdGVhZCwgTWljaGFlbFggRDEsMCoGCSqG
SIb3DQEJARYdbWljaGFlbHguZC5oYWxzdGVhZEBpbnRlbC5jb20wggEiMA0GCSqGSIb3DQEBAQUA
A4IBDwAwggEKAoIBAQCT54aUP7frrWIkjmUKeKI6kQZYPvxshfLcWDWoYLIbX7FjcvZk9f+fZKVv
8DZEjW295Ok+mdlk1Nhd0p8pWWsY1LBnP0xUtoKbvvdVCW9iRnXW7rVrWDZWj7ClwY1YqVXP62MQ
5S59UUkdNa58BOwrik97VL1GMirc3JWQq7rHONCsvFOgYrRGtoPEVXNJmCxQSNvtk+I8ca9MEZjt
j3vfEfTXeFznIeoyDWf7URqi+gni2++dRbQrdZ8mLxmNJdMlJUAaqSx0G9SfPom6SKzqU9rCQm8M
3SpIbABmsPXEPL0fp29QyFYZ5m82zvGyXMe9Pan1QGTBS0mzN8dXUflBAgMBAAGjggL+MIIC+jAL
BgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhsOMdYSZ5VGD/YEohY6fU4KR
wAlngd69OZXwQwIBZAIBCDAdBgNVHQ4EFgQUJk3jEVrxKZ64UR5dIZFYuae9EsowHwYDVR0jBBgw
FoAUDsYq91myCBCQJW/D3f2KZjEwK8Uwgc8GA1UdHwSBxzCBxDCBwaCBvqCBu4ZXaHR0cDovL3d3
dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNz
dWluZyUyMENBJTIwM0IoMSkuY3JshmBodHRwOi8vY2VydGlmaWNhdGVzLmludGVsLmNvbS9yZXBv
c2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjAzQigx
KS5jcmwwgfUGCCsGAQUFBwEBBIHoMIHlMGwGCCsGAQUFBzAChmBodHRwOi8vd3d3LmludGVsLmNv
bS9yZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1
aW5nJTIwQ0ElMjAzQigxKS5jcnQwdQYIKwYBBQUHMAKGaWh0dHA6Ly9jZXJ0aWZpY2F0ZXMuaW50
ZWwuY29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUy
MElzc3VpbmclMjBDQSUyMDNCKDEpLmNydDAfBgNVHSUEGDAWBggrBgEFBQcDBAYKKwYBBAGCNwoD
DDApBgkrBgEEAYI3FQoEHDAaMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwwwVwYDVR0RBFAwTqAt
BgorBgEEAYI3FAIDoB8MHW1pY2hhZWx4LmQuaGFsc3RlYWRAaW50ZWwuY29tgR1taWNoYWVseC5k
LmhhbHN0ZWFkQGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAYhkFmzYPyglQnUZ4eQ97qiqp
tBjcYz7GQEJr8rw0i5tDicNe9kRuCd9WLdz+yA9pB3ilFGtwdu0iULXUInoeHthbPIWQOkRb7Gdz
BRYXx7qcm8e9vzNd91bog9JFjPMK6/TTh1MfztT8p9vUYFjYzPYGXrFWvPpQk9eHzAWQPhfHnx39
rkvHfXuV1oGvzNBb2KmFeZUBfHyyD8BTjZ+ys1Ib2XdBHeN0NxA4o50er8KhsB8ArFUc859fJRPy
I7M9x8N4NGAeGOhL7ZkzMXAqJGaVOcDbww+L7v0bssb7rRDK510weUBUVcOw20MLc+NfW2tWjtIt
Ze1KCoPk/LRw9zCCBm4wggVWoAMCAQICCmHEZr8AAQAAZWMwDQYJKoZIhvcNAQEFBQAwVjELMAkG
A1UEBhMCVVMxGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDNBMB4XDTExMDYxNjIxNDcxNloXDTE0MDUzMTIxNDcxNlow
TTEdMBsGA1UEAxMUSGFsc3RlYWQsIE1pY2hhZWxYIEQxLDAqBgkqhkiG9w0BCQEWHW1pY2hhZWx4
LmQuaGFsc3RlYWRAaW50ZWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmsyV
tXmiFwHyxGN9FZakm0tdpfQFob1JyjM2Yk+3oGWk1jJz4/WIEREAnzWwaeFn64fWrK9GHdjFJ/xY
qYU3LFi+jZAIX+Ymenq9PUyIU9xj4dviBj5pjF+Cl9Pg55prEukHyGAosEcyD7+s1vSiRx3KXWz0
FqHWx8m4dsnLjfzfWxWC2eixDN2n8yUISCXr88hM1RplQ5If/K9yho2KjPclwzH0MskIx83sOFOd
XrTVSYNHeQ5KYRYg5GZlXOcawvvRrZdkeh2PdAdqCJN+R3+wMLpAbSR2CRj/3u5y2awKRoOYpyrz
Q0FUtFA1VOK/Da3HbxdRqcHhrXceqHMW1QIDAQABo4IDRTCCA0EwCwYDVR0PBAQDAgQwMD0GCSsG
AQQBgjcVBwQwMC4GJisGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJZ4S52UGHhP9OAgFkAgEM
MEQGCSqGSIb3DQEJDwQ3MDUwDgYIKoZIhvcNAwICAgCAMA4GCCqGSIb3DQMEAgIAgDAHBgUrDgMC
BzAKBggqhkiG9w0DBzAdBgNVHQ4EFgQUPloMloRS6WhyKZkxS5yq0sJDMLYwHwYDVR0jBBgwFoAU
qhZmr7c9VlNgrg3C7fPuB8tRYH4wgc8GA1UdHwSBxzCBxDCBwaCBvqCBu4ZXaHR0cDovL3d3dy5p
bnRlbC5jb20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWlu
ZyUyMENBJTIwM0EoMSkuY3JshmBodHRwOi8vY2VydGlmaWNhdGVzLmludGVsLmNvbS9yZXBvc2l0
b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjAzQSgxKS5j
cmwwgfUGCCsGAQUFBwEBBIHoMIHlMGwGCCsGAQUFBzAChmBodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5n
JTIwQ0ElMjAzQSgxKS5jcnQwdQYIKwYBBQUHMAKGaWh0dHA6Ly9jZXJ0aWZpY2F0ZXMuaW50ZWwu
Y29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElz
c3VpbmclMjBDQSUyMDNBKDEpLmNydDAfBgNVHSUEGDAWBggrBgEFBQcDBAYKKwYBBAGCNwoDBDAp
BgkrBgEEAYI3FQoEHDAaMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwQwVwYDVR0RBFAwTqAtBgor
BgEEAYI3FAIDoB8MHW1pY2hhZWx4LmQuaGFsc3RlYWRAaW50ZWwuY29tgR1taWNoYWVseC5kLmhh
bHN0ZWFkQGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEADYbb8KolLSdsr/yaSsqnL7lztUly
NciWyBqR7bedm1OFngMn0vp2MvooGVzdmzysmkrCqf1KAjgnN0rUEyQpp2GfBFjZBG3+y2JYxrtn
jneqtPjrkK3qPrPKAa/mEgreV8tgyWGiZMUl0O2B3Mz27rmwDQEUx++QGIuO9A2emxGlarqz58PX
rPxl2R4ocWNTI2DKdgTPNjsygdnb02NcgbOVdZekidfVYbQaGaV+DplF3LjRNT/WPLzZ4u4QAKD1
eOs3yRMdotRu3BJnbFcgFcDnDnY6KXblLkPaDoS5WEQyBLqMlrHSA+A+1zc3D8dpEIozPTR8ANzd
++v6BQOLQzGCAzkwggM1AgEBMGQwVjELMAkGA1UEBhMCVVMxGjAYBgNVBAoTEUludGVsIENvcnBv
cmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENBIDNCAgphxp20
AAEAAHBkMAkGBSsOAwIaBQCgggGqMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTExMDcwODIyMjgyOVowIwYJKoZIhvcNAQkEMRYEFP+XmXgZEL5jC/Nl63WB5N0fWJVj
MF8GCSqGSIb3DQEJDzFSMFAwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDBzBgkrBgEEAYI3EAQxZjBk
MFYxCzAJBgNVBAYTAlVTMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjErMCkGA1UEAxMiSW50
ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSAzQQIKYcRmvwABAABlYzB1BgsqhkiG9w0BCRAC
CzFmoGQwVjELMAkGA1UEBhMCVVMxGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQD
EyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENBIDNBAgphxGa/AAEAAGVjMA0GCSqGSIb3
DQEBAQUABIIBAB/l6YIKWMvx9gHpp6n5zLvcBSKej3L51BfOY8FVKKQr0kj1J/+BsiDP26bH1vWN
38yixexstEsjOJXFPK5Lt26xWtk6QBMkc1mFGLV53QKXQ+GkM0/gsFqyokBH4txYOS0CPq8rSHBr
lalvhpufBLAt0PkR326aui3p3MZPtgVtRMHquWEybgc+LMagtVP9IQOqNux6NFs0OKfpDZep0yK0
x6fvubUdFV0nijql2a4BInl8Xc4eONzMjk9x046iazwvRSeIhqz25YtU3HC6/0AeZLoaGZTO9uu/
C3RgrNv4lzvWhvTC+ka1ni3g2X7eG+ZazxtmHXfiqM3dpzKDmjoAAAAAAAA=

--------------ms080806090704050504000800--
