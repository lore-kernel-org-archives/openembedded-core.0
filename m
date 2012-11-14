Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mhalstead@linuxfoundation.org>) id 1TYkOl-00061I-F6
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 22:21:28 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so531520pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 13:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:x-gm-message-state;
	bh=xuZdJvq1u2hJV4UuaiZ+7ow8c2UhmAcPRKv/9i9pfTs=;
	b=QMiOEiaIyKRFlL9+id7s0Hj5AcUcnj3GhHM1Z4YcLc2jcHqHQTHNhsaqQkczwH8BQY
	j+1u4RLxEuObVzoQPWva3JXw1ciTZnRYNqlyrxSR09ccjgFVCb9TvV1C6wXVndVV7EH8
	Ff/GpcpbYwgHFwukdu2BLv97jXJUwmnKo/DbWRSkQZvKReBFbmm8QVYVmGNkZReIRFFw
	gychzpMp5NDU+JqwTzyy7az3nds5r6TU0Nmno8HLr5cdjOvF5TYwvt4pAYJhSHuINVFU
	8hvNy5wtzfbGmGQTufsO3kTBhPnpvIDePGn3vXm5mK9qB+P+humVpnzYpO9u5ZKwOQ3X
	4k6Q==
Received: by 10.66.87.202 with SMTP id ba10mr10841945pab.72.1352927250646;
	Wed, 14 Nov 2012 13:07:30 -0800 (PST)
Received: from [192.168.1.66] (static-50-43-44-186.bvtn.or.frontiernet.net.
	[50.43.44.186])
	by mx.google.com with ESMTPS id un16sm8259967pbc.47.2012.11.14.13.07.28
	(version=SSLv3 cipher=OTHER); Wed, 14 Nov 2012 13:07:29 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <50A4080D.6050906@yoctoproject.org>
Date: Wed, 14 Nov 2012 13:07:25 -0800
From: Michael Halstead <michael@yoctoproject.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1352815159.24487.122.camel@ted>
	<20121114123026.GK3928@jama.jama.net>
	<1352899442.13332.2.camel@ted> <1352899832.13332.7.camel@ted>
	<50A3F4F1.2080008@yoctoproject.org>
In-Reply-To: <50A3F4F1.2080008@yoctoproject.org>
X-Enigmail-Version: 1.4.5
X-Gm-Message-State: ALoCoQn6KxS+/xS84WcrH4J14WPpn/kcwwrCFZ5hndoxdEQ2vf7rmED/lBCSOfYkRI+XExerv6OP
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Wed, 14 Nov 2012 21:21:28 -0000
X-Groupsio-MsgNum: 31382
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms060706000508050909080706"

--------------ms060706000508050909080706
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/14/2012 11:45 AM, Michael Halstead wrote:
> On 11/14/2012 05:30 AM, Richard Purdie wrote:
>> On Wed, 2012-11-14 at 13:24 +0000, Richard Purdie wrote:
>>> On Wed, 2012-11-14 at 13:30 +0100, Martin Jansa wrote:
>>>> On Tue, Nov 13, 2012 at 01:59:19PM +0000, Richard Purdie wrote:
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>> ---
>>>>> diff --git a/meta/recipes-extended/bash/bash-4.2/crossfix.patch b/m=
eta/recipes-extended/bash/bash-4.2/crossfix.patch
>>>>> new file mode 100644
>>>>> index 0000000..f587c34
>>>>> --- a/dev/null
>>>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>>>>> @@ -0,0 +1,28 @@
>>>> Are you using some special tool to generate git patches or some weir=
d
>>>> git version?
>>> Basically, the data from cgit in the web interface is broken and that=
 is
>>> causing this.
>>>
>>>> Patches from you where you add some file usually does not apply here=
,
>>>> It's caused by:
>>>> --- a/dev/null
>>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>>>> which usually looks like
>>>> --- /dev/null
>>>> +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>>> Right, there is a bug in cgit. I'm not sure if anyone fancies trying =
to
>>> find/fix it?
>> Actually, its not hard to find:
>>
>> http://hjemli.net/git/cgit/tree/ui-patch.c
>>
>>
>> In header(), the:
>> 		htmlf("\n--- a/%s\n", path1);
>> 		htmlf("+++ b/%s\n", path2);
>> needs to be conditional on is_null_sha1(sha1)/is_null_sha1(sha2) with
>> the alternative of:
>> 		htmlf("\n--- /%s\n", path1);
>> 		htmlf("+++ /%s\n", path2);
>> which there are a variety of ways to achieve...
>>
>> Michael: Fancy fixing that on the server and sending a patch
>> upstream? :)
>>
>> Cheers,
>>
>> Richard
>>
> I'm happy to. I've fixed the code you've tracked down and recompiled fo=
r
> git.yoctoproject.org. You can see the result at
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/patch/?id=3Ded234aca98d=
0867c7b32801fc63820b19cf67df9
> but I am still working on fixing the shared UI for this view
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Ded234aca98=
d0867c7b32801fc63820b19cf67df9.
>
>
> Once I have both fixes I'll upgrade http://cgit.openembedded.org/ with
> the new version and submit my patch upstream.
>
I've submitted the patch upstream and installed a fixed copy of cgit on
cgit.openembedded.org. Please let me know if any errors in the
formatting remain.

Michael Halstead
Yocto Project / Sys Admin



--------------ms060706000508050909080706
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINjDCCBjQw
ggQcoAMCAQICASAwDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDI1NVoX
DTE3MTAyNDIxMDI1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMsohUWcASz7GfKrpTOMKqANy9BV7V0igWdGxA8IU77L3aTxErQ+
fcxtDYZ36Z6GH0YFn7fq5RADteP0AYzrCA+EQTfi8q1+kA3m0nwtwXG94M5sIqsvs7lRP1aycBke
/s5g9hJHryZ2acScnzczjBCAo7X1v5G3yw8MDP2m2RCye0KfgZ4nODerZJVzhAlOD9YejvAXZqHk
sw56HzElVIoYSZ3q4+RJuPXXfIoyby+Y2m1E+YzX5iCZXBx05gk6MKAW1vaw4/v2OOLy6FZH3XHH
tOkzUreG//CsFnB9+uaYSlR65cdGzTsmoIK8WH1ygoXhRBm98SD7Hf/r3FELNvUCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBSuVYNv7DHKufcd
+q9rMfPIHeOsuzAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBADqpJw3I07QW
ke9plNBpxUxcffc7nUrIQpJHDci91DFG7fVhHRkMZ1J+BKg5UNUxIFJ2Z9B90Micc/NXcs7kPBRd
n6XGO/vPc87Y6R+cWS9Nc9+fp3Enmsm94OxOwI9wn8qnr/6o3mD4noP9JphwUPTXwHovjavRnhUQ
HLfo/i2NG0XXgTHXS2Xm0kVUozXqpYpAdumMiB/vezj1QHQJDmUdPYMcp+reg9901zkyT3fDW/iv
JVv6pWtkh6Pw2ytZT7mvg7YhX3V50Nv860cV11mocUVcqBLv0gcT+HBDYtbuvexNftwNQKD5193A
7zN4vG7CTYkXxytSjKuXrpEatEiFPxWgb84nVj25SU5q/r1Xhwby6mLhkbaXslkVtwEWT3Van49r
KjlK4XrUKYYWtnfzq6aSak5u0Vpxd1rY79tWhD3EdCvOhNz/QplNa+VkIsrcp7+8ZhP1l1b2U6Ma
xIVteuVMD3X0vziIwr7jxYae9FZjbxlpUemqXjcC0QaFfN7qI0JsQMALL7iGRBg7K0CoOBzECdD3
fuZil5kU/LP9cr1BK31U0Uy651bFnAMMMkqhAChIbn0ei72VnbpSsrrSdF0BAGYQ8vyHae5aCg+H
75dVCV33K6FuxZrf09yTz+Vx/PkdRUYkXmZz/OTfyJXsUOUXrym6KvI2rYpccSk5MIIHUDCCBjig
AwIBAgICIgMwDQYJKoZIhvcNAQEFBQAwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENv
bSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYD
VQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTAeFw0x
MjA2MTMwNDU5MjlaFw0xNDA2MTQxNjE4MzBaMIGRMRkwFwYDVQQNExBnMDFwWTYwMWJGM1BrRTY3
MQswCQYDVQQGEwJVUzEPMA0GA1UECBMGT3JlZ29uMRIwEAYDVQQHEwlIaWxsc2Jvcm8xGTAXBgNV
BAMTEE1pY2hhZWwgSGFsc3RlYWQxJzAlBgkqhkiG9w0BCQEWGG1pY2hhZWxAeW9jdG9wcm9qZWN0
Lm9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMFZ+GW0VKdiyuQy3hlOvwcHxcm0
8ZwNGGah4zipYky5wVFZO7p9LjJfyF6rvd24xdkaTluxTMmd9pfq2cOVQ6c3RsPufv1yBUbytk6F
4Wk+qD0qEGjuHh5FfakcLIEsHiSn3nzaQZHaolS/yzx/A3coQS8pQrshZYqAF/ME5OxMyL8KDdtk
xatt1reDPqzvI5rKYdeEbmHsTYgd9WWHvs8MfZFHidZoAXMXU+PcsKCUxEYhgP/h9NKcTApu/Mhd
IPKn11pD+gfDM+ochGu1uxuW/t1tNJyRYDVQSDV+rpliQ7mrimSmyktIKkow02pUk4Xw3OqdYq7/
/HpVOUs5nk8CAwEAAaOCA7MwggOvMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQG
CCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUcZFNotb1OfDmPE6GQ6MQIBh7meUwHwYDVR0j
BBgwFoAUrlWDb+wxyrn3HfqvazHzyB3jrLswIwYDVR0RBBwwGoEYbWljaGFlbEB5b2N0b3Byb2pl
Y3Qub3JnMIICIQYDVR0gBIICGDCCAhQwggIQBgsrBgEEAYG1NwECAjCCAf8wLgYIKwYBBQUHAgEW
Imh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0YXJ0
Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdhcyBp
c3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAyIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9m
IHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBw
dXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMIGc
BggrBgEFBQcCAjCBjzAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgECGmRM
aWFiaWxpdHkgYW5kIHdhcnJhbnRpZXMgYXJlIGxpbWl0ZWQhIFNlZSBzZWN0aW9uICJMZWdhbCBh
bmQgTGltaXRhdGlvbnMiIG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3kuMDYGA1UdHwQvMC0wK6Ap
oCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUyLWNybC5jcmwwgY4GCCsGAQUFBwEBBIGB
MH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3MyL2NsaWVu
dC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3ViLmNsYXNz
Mi5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29tLzANBgkq
hkiG9w0BAQUFAAOCAQEANR/d6M8GHL/rkx3Kz9ILDxYMcekmFgefaDXNQMicUHiUw5TsIl5af1pS
Y2AvbKlA2/FZnyG8w42FuK6ZQBZJxs4/N10NW8qDmuuFTi6TyJgurj73tx9RogW50miDHMZLoMRe
avB1h8zy99L2lRPZSebpSFkrQdYDHaGRVhYMjEcWNW9cLxhR8BaAEw/KlpERv3hUQpwGMppYOE66
M7KJ3HpeR7DXfa4njL9W2hukTQNsskdWtzejHp5iQ65+5Mv+NXLmYP4uLJcR9AbttgNhwStc0P1b
LxnQkElGeUzATOBq+QsVZ7Fo6sSS7kqrhpfaPibqpj83m/wSgpKVsbZJ3DGCA9owggPWAgEBMIGT
MIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJl
IERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMiBQ
cmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAiIDMAkGBSsOAwIaBQCgggIbMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTExNDIxMDcyNVowIwYJKoZIhvcN
AQkEMRYEFNXxlNnjf5tqxVJOnATNLGgKBrRcMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgaQGCSsGAQQBgjcQBDGBljCBkzCBjDELMAkGA1UEBhMC
SUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRp
ZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDIgUHJpbWFyeSBJbnRlcm1l
ZGlhdGUgQ2xpZW50IENBAgIiAzCBpgYLKoZIhvcNAQkQAgsxgZaggZMwgYwxCzAJBgNVBAYTAklM
MRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZp
Y2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRp
YXRlIENsaWVudCBDQQICIgMwDQYJKoZIhvcNAQEBBQAEggEAoZgSCMUUumDpHiI0MjkRJUAwoFeI
BrewC+A4X514U4iavoQw5xiamaOmMA3oJPlYyofw3rcqsGMTTVGWRtTppz1TcphxPp5LRPAcE5DZ
Azjvh7pNk0Xjr0t2n8NTkdOCNw3g4XyF0QLkyVnga9MfmjE+9YkgNfam3tNTfaeqGFMXAz/9ckpE
co6DN743supa+se8/szIz0Jdw+lQSZvm/RqW1xOmpdfLQg8l58BrZq+8/FnxgfvfQZ2rd8Uf+x4K
LPH2CCy1qsRZsAUpQh1kEViZMadjp6KJwqXl2skRQClK/gSC7U5nnPVO7duV9aPHg8MQJKRVeH1o
izOls4OFlwAAAAAAAA==

--------------ms060706000508050909080706--
