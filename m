Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 810A06C474
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 17:16:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2018 09:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,240,1539673200"; 
	d="p7s'?scan'208";a="108745314"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2018 09:16:27 -0800
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.131]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.101]) with mapi id
	14.03.0415.000; Fri, 16 Nov 2018 17:16:26 +0000
From: "Kubo Da Costa, Raphael" <raphael.kubo.da.costa@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [rocko][PATCH] m4: Workaround gnulib's fseeko.c
	implementation
Thread-Index: AQHUfc61C9JFK4FOHk6Y/mbi8IGJO6VSpJMA
Date: Fri, 16 Nov 2018 17:16:25 +0000
Message-ID: <2a06fb2631686ac5691b5943815535167fe774bb.camel@intel.com>
References: <20181114132336.71049-1-raphael.kubo.da.costa@intel.com>
	<5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com>
	<871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAMKF1sobx8ed6ncDifE-iCDyn=+NZpar2Wb4dXwbKzkmcphEWA@mail.gmail.com>
In-Reply-To: <CAMKF1sobx8ed6ncDifE-iCDyn=+NZpar2Wb4dXwbKzkmcphEWA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.7.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Fri, 16 Nov 2018 17:16:27 -0000
X-Groupsio-MsgNum: 118294
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature";
	boundary="=-oQyz0td/uAKvAnOjx/Iw"

--=-oQyz0td/uAKvAnOjx/Iw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 09:05 -0800, Khem Raj wrote:
> On Fri, Nov 16, 2018 at 7:51 AM Raphael Kubo da Costa
> <raphael.kubo.da.costa@intel.com> wrote:
> > What's the relationship between the -next, -nmut and -nmut2
> > branches in Yocto's poky-contrib? How do they interact with oe-
> > core's -next branches? And what's the process for merging them into
> > the actual stable branches?
>=20
> they are staging private branches used by maintainers. Eventually
> they should show up in <release>-next and then into <release> branch

Right, and how do I know which and whose branch(es) to check for before
sending a backport (or even to track in case I just want things to work
locally)?

--=-oQyz0td/uAKvAnOjx/Iw
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKjTCCBOsw
ggPToAMCAQICEDabxALowUBS+21KC0JI8fcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzEyMTEwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzuW/y/g0bznz8BD48M94luFzqHaqY9yGN9H/W0J7hOVBpl0rTQJ6kZ7z7hyDb9kf2UW4ZU25alC
i+q5m6NwHg+z9pcN7bQ84SSBueaYF7cXlAg7z3XyZbzSEYP7raeuWRf5fYvYzq8/uI7VNR8o/43w
PtDP10YDdO/0J5xrHxnC/9/aU+wTFSVsPqxsd7C58mnu7G4VRJ0n9PG4SfmYNC0h/5fLWuOWhxAv
6MuiK7MmvTPHLMclULgJqVSqG1MbBs0FbzoRHne4Cx0w6rtzPTrzo+bTRqhruaU18lQkzBk6OnyJ
UthtaDQIlfyGy2IlZ5F6QEyjItbdKcHHdjBX8wIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFNpBI5xaj3GvV4M+INPjZdsMywvbMA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAp9XGgH85hk/3IuN8F4nrFd24MAoau7Uq
M/of09XtyYg2dV0TIPqtxPZw4813r78WwsGIbvtO8VQ18dNktIxaq6+ym2zebqDh0z6Bvo63jKE/
HMj8oNV3ovnuo+7rGpCppcda4iVBG2CetB3WXbUVr82EzECN+wxmC4H9Rup+gn+t+qeBTaXulQfV
TYOvZ0eZPO+DyC2pVv5q5+xHljyUsVqpzsw89utuO8ZYaMsQGBRuFGOncRLEOhCtehy5B5aCI571
i4dDAv9LPODrEzm3PBfrNhlp8C0skak15VXWFzNuHd00AsxXxWSUT4TG8RiAH61Ua5GXsP1BIZwl
4WjK8DCCBZowggSCoAMCAQICEzMAAGOK8UZDfjXl5y0AAAAAY4owDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTgwNjA2MDk0NDM3WhcNMTkwNjAxMDk0NDM3WjBRMR8wHQYDVQQDExZLdWJvIERh
IENvc3RhLCBSYXBoYWVsMS4wLAYJKoZIhvcNAQkBFh9yYXBoYWVsLmt1Ym8uZGEuY29zdGFAaW50
ZWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnE49L58OnzMvbeGR+G6XgfgR
xcXQCTSFP+MXa9tavURiOh6qn+ujk/G5Zj9CnoXYgS7UN6o1VxVlv139+34w0P6cAzt2lRkLA24+
OYsqrMLbB4F+TbFtqEFq+4sBXAAVztZKqtjNsxCjAfVFdg3ayLSNYiKwGPH7W3man3Yip0hesrh8
3GFdNGXrAWcRTNK78lwEj7z8kYDOU32F1vYSV5LKbv50lb4+QT7GB6ImV4EtQp/8GQuqOJtnAIHH
btLpMyAPQOx0PrKO1B+y4h4IDRsajlCZbRtLhMcqAZS9uh8PbjuA8umdqdBqJjXiazHlPRTr6PAF
Tw0I2OyM2bPnIQIDAQABo4ICQTCCAj0wHQYDVR0OBBYEFH8tOH74XvAfjslOQwUSSZaTYnCvMB8G
A1UdIwQYMBaAFNpBI5xaj3GvV4M+INPjZdsMywvbMGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93
d3cuaW50ZWwuY29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElz
c3VpbmclMjBDQSUyMDRCLmNybDCBnwYIKwYBBQUHAQEEgZIwgY8wIgYIKwYBBQUHMAGGFmh0dHA6
Ly9vY3NwLmludGVsLmNvbS8waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBD
QSUyMDRCLmNydDALBgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhsOMdYSZ
5VGD/YEohY6fU4KRwAlngd69OZXwQwIBZAIBCTAfBgNVHSUEGDAWBggrBgEFBQcDBAYKKwYBBAGC
NwoDDDApBgkrBgEEAYI3FQoEHDAaMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwwwWwYDVR0RBFQw
UqAvBgorBgEEAYI3FAIDoCEMH3JhcGhhZWwua3Viby5kYS5jb3N0YUBpbnRlbC5jb22BH3JhcGhh
ZWwua3Viby5kYS5jb3N0YUBpbnRlbC5jb20wDQYJKoZIhvcNAQEFBQADggEBALdE6QCGCFng/HQX
PUCf3gkovENTCzOLRcxeeuL2JyeQ3jGHkM5oN+9h3OoA1TfXYKmB6cmWigxbnndMdKDhT7/dHNm3
dJa3LPFYVZrETT6ejUSZU+vFNyUUi8f7NBWlZ8SyLOCr2ypkr5vKBv2imzih/imXHTFcREGSCDh6
P0s/Fv0a+iuJB0rZmzYALqiwWLonz9MZ9Y+xSpOqv0/vBBPpBgp/2Wt7YyjdIdCyVxsEKFzVq0e0
+TUjPZdHZ21uNQm4Uu3bVvz2btSTYRa+QQ79CcRbRFqqjNhif9Xp8XHg5TbmE3A24qloXk0+pEGT
xHbL6Dbplid+MFEgjxWvcHoxggIXMIICEwIBATCBkDB5MQswCQYDVQQGEwJVUzELMAkGA1UECBMC
Q0ExFDASBgNVBAcTC1NhbnRhIENsYXJhMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjErMCkG
A1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSA0QgITMwAAY4rxRkN+NeXnLQAA
AABjijAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMTgxMTE2MTcxNjIzWjAjBgkqhkiG9w0BCQQxFgQUsJp2yF1+z8xyvo3BczFYJNjQW5AwDQYJ
KoZIhvcNAQEBBQAEggEAVlLJwpcysotwA+8cUbhV4KA8MeCXae1HWY2gVEAMj478fX1C4OHGUBWW
RnfPbpx8SIxaYsVCJ8Oeq5YjDtQ8yBwDJddv358pS07umfajQDlLHB+wRyQ2bkz5AzMdtwCVmI9A
pey/SBGXLb5NFfN49wCz+6XXvCbnCGwnxzjeKg00gfa1fVlxsFmJPZx42Q4FmHO/vFt1m63u53qB
kDBx/HEfPfcKhWG0TMMXy+9vE5Wdszgxim1t6FzIDo46my8Qw71hsZmCpXJRujqMVQBFW0qtuEPI
Bb57O8cq32kD6EKXYrvKbeC2ehclA8XASXqu5xwPguXdmCC//QTTZ113AQAAAAAAAA==

--=-oQyz0td/uAKvAnOjx/Iw--
