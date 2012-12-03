Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mhalstead@linuxfoundation.org>) id 1TfYjG-0006wL-16
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:46 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1722228pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:x-gm-message-state;
	bh=ty74FFkCMyZFieTuZyB/jl0493Z4cM5VNeMf+Wky65o=;
	b=Kf2gvRZUDqQ/1DWYor8zraV0m2Y7cybGLc0eGeXrn49MwtU7ejSqL0CeUNMkVupRGW
	NSMMzA6rX0sfQnWDZwNQUnfc98g+JGfTcsL5XxOmc6jcopp0KfI2N0Va062mJ3pC32Lw
	q7QtFHmp/LZ2Wt1NOBStr4+cmw1whD8iW9D8qecSsL56jXIgPIOtrAI3G97gIyXFpccg
	5EgsSewSf4NBV9XTP8fT4/89I2T+Y8L3xN7GRd/kcltYJ1RcTySP1v0mnvtHdZPZpmXR
	GHf8Ri/dIE719Q3xqbxgT+rSzXccKgDXQK/i+oGIL0LWYFC9n+LDqaf4cWYIeDabGD/I
	iHEQ==
Received: by 10.68.252.40 with SMTP id zp8mr30539746pbc.66.1354550663819;
	Mon, 03 Dec 2012 08:04:23 -0800 (PST)
Received: from pride.localdomain (static-50-43-58-233.bvtn.or.frontiernet.net.
	[50.43.58.233])
	by mx.google.com with ESMTPS id na4sm8259819pbc.18.2012.12.03.08.04.20
	(version=SSLv3 cipher=OTHER); Mon, 03 Dec 2012 08:04:22 -0800 (PST)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <50BCCD83.7040205@yoctoproject.org>
Date: Mon, 03 Dec 2012 08:04:19 -0800
From: Michael Halstead <michael@yoctoproject.org>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <50B63784.5050502@enea.com> <1354119751.15992.2.camel@ted>
	<CADkTA4P8=aLSXNTAENp+WW7xX+ttYAPhPufRE=+yn9KXOY8Sag@mail.gmail.com>
	<50B71FD4.3090304@enea.com> <50B766CC.4030904@se-eng.com>
	<1354197267.4053.4.camel@ted> <50B89887.3070003@gmail.com>
	<50B8E999.2050109@linux.intel.com>
	<CADkTA4OPBKm6c1BPx3PGVuN9AHsmJZbG7Z7XhZd2OzT==Q5mHg@mail.gmail.com>
	<50B8F4FE.1070003@yoctoproject.org> <50B9145E.9080005@se-eng.com>
	<50B93FFB.9050505@yoctoproject.org> <50BA6C04.9040900@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF8F2064@IRSMSX101.ger.corp.intel.com>
	<50BCCC84.5050704@linux.intel.com>
In-Reply-To: <50BCCC84.5050704@linux.intel.com>
X-Enigmail-Version: 1.4.6
X-Gm-Message-State: ALoCoQk/LH1v1o9kuvtfzXd0jObk2sJmiyxqRyXMKVaH0uCAUMb2kOx6S7C932idp17CaH3MBe/O
Cc: oe-core layer <openembedded-core@lists.openembedded.org>,
	=?ISO-8859-1?Q?David_Nystr=F6?=
Subject: Re: meta-cloud layer
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:46 -0000
X-Groupsio-MsgNum: 32096
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms060102090603010400030508"

--------------ms060102090603010400030508
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 12/03/2012 08:00 AM, Saul Wold wrote:
> On 12/03/2012 07:20 AM, Prica, Mihai wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of David Nystr=F6m
>> Sent: Saturday, December 01, 2012 10:44 PM
>> To: Michael Halstead
>> Cc: oe-core layer
>> Subject: Re: [OE-core] meta-cloud layer
>>
>> On 12/01/2012 12:23 AM, Michael Halstead wrote:
>>> On 11/30/2012 12:17 PM, Raymond Danks wrote:
>>>> On 11/30/2012 11:03 AM, Michael Halstead wrote:
>>>>> On 11/30/2012 09:26 AM, Bruce Ashfield wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Fri, Nov 30, 2012 at 12:15 PM, Saul Wold <sgw@linux.intel.com
>>>>>> <mailto:sgw@linux.intel.com>> wrote:
>>>>>>
>>>>>>       On 11/30/2012 03:29 AM, David Nystr=F6m wrote:
>>>>>>
>>>>>>           On 11/29/2012 02:54 PM, Richard Purdie wrote:
>>>>>>
>>>>>>               On Thu, 2012-11-29 at 06:44 -0700, Raymond Danks
>>>>>> wrote:
>>>>>>
>>>>>>                   Thanks for looping me in here David. The initial=

>>>>>>                   goal for the meta-xen
>>>>>>                   layer was in fact to encompass Xen Cloud Platfor=
m.
>>>>>>                    As such, the intent
>>>>>>                   was to contain both hypervisor and user-space
>>>>>>                   applications.  Indeed, the
>>>>>>                   xen distribution itself includes xm/libxl;
>>>>>>                   hypervisor abstraction would
>>>>>>                   be somewhat tedious in my opinion.
>>>>>>
>>>>>>                   The layer just received commits for expanding th=
e
>>>>>>                   libvirt build to
>>>>>>                   support qemu.  The commonalities and shared
>>>>>> packaged
>>>>>>                   between xen, qemu,
>>>>>>                   and kvm implementations are such that I would al=
so
>>>>>>                   agree that meta-xen
>>>>>>                   should be expanded/renamed to encompass all
>>>>>>                   virtualization types; I also
>>>>>>                   support the move to meta-virtualization.
>>>>>>
>>>>>>
>>>>>>           meta-virtualization sounds good, let co-op on this so we=

>>>>>>           don't duplicate
>>>>>>           work.
>>>>>>
>>>>>>       If everyone is OK with this, I will have Michael Halstead
>>>>>> create
>>>>>>       a repo, please send him your keys so that you will have writ=
e
>>>>>>       access to it.
>>>>>>
>>>>>>
>>>>>> This works for me. If Michael already has our keys, do we need to
>>>>>> resend or can a local copy happen ?
>>>>> I already have keys for,
>>>>>
>>>>> David Nystrom df:2d:b1:59:f3:d7:73:fc:59:36:7b:cf:85:28:a7:50
>>>>> Bruce Ashfield  4f:93:90:b2:c7:a1:45:21:f2:47:31:6f:60:f9:60:02
>>>>>
>>>>> Either of you can currently add
>>>>> git@git.yoctoproject.org:meta-virtualization as a git remote and
>>>>> start the repository. Once we have initial code and the maintainers=

>>>>> and patch submission guidelines in the readme I can publicly list t=
he
>>>>> new repository.
>>>>>
>>>>> I require an ssh public key for Raymond Danks.
>>>> Thanks Michael.  I got your response and was able to push meta-xen t=
o
>>>> the newly created repository on meta-virtualization.  I added one
>>>> commit to tweak the README and conf/layer.conf for the new name.
>>>>>
>>>>>
>>>>> We also need a short description for the listing on
>>>>> git.yoctoproject.org. I could be something similar to, but better
>>>>> than, "Layer enabling virtualization support. "
>>>> How about "Layer enabling hypervisor, virtualization tool stack, and=

>>>> cloud support."
>>>>
>>> Sounds good to me. Thank you.
>>>> Also - I referenced the mail alias meta-virtualization at yoctoproje=
ct
>>>> in the README.  When you publish this, can we use something like tha=
t
>>>> as well?
>>>>
>>> I can add a private list for meta-virtualization@yoctoproject.org. Wh=
o
>>> shall I add to membership?
>>>
>>>
>>> I would like to be added, since it seems I can't add myself at
>>> https://lists.yoctoproject.org/listinfo
>>>
>>> Best Regards,
>>> David
>>
>> I would like to be added as well to the private list.
>>
> Just to be clear to all this is not a private list, there was some
> issue I think with getting it initialized, it is visiable and
> available to all from the https://lists.yoctoproject.org/listinfo URL,
> and it is getting added to the main list of Mailing lists today.
>
> Sorry for any confusion.
>
> Sau!
>
This was a misunderstanding on my part. I thought this was a simple mail
alias for the maintainers. A full list has been set up and can be seen
at https://lists.yoctoproject.org/ or
https://lists.yoctoproject.org/listinfo. Anyone can subscribe. I'm also
working on getting this list added to Gmane for fans for NNTP.


--=20
Michael Halstead
Yocto Project / Sys Admin


>
>> Thanks,
>> Mihai
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>




--------------ms060102090603010400030508
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTIwMzE2MDQxOVowIwYJKoZIhvcN
AQkEMRYEFGkF3TMIoovNWcvvS3KwOFche31fMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgaQGCSsGAQQBgjcQBDGBljCBkzCBjDELMAkGA1UEBhMC
SUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRp
ZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDIgUHJpbWFyeSBJbnRlcm1l
ZGlhdGUgQ2xpZW50IENBAgIiAzCBpgYLKoZIhvcNAQkQAgsxgZaggZMwgYwxCzAJBgNVBAYTAklM
MRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZp
Y2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAyIFByaW1hcnkgSW50ZXJtZWRp
YXRlIENsaWVudCBDQQICIgMwDQYJKoZIhvcNAQEBBQAEggEAXJRId3O2VeqAY86QYxQ6D0N9JdfI
DuxISwPU1W4fuSzrrhPcCHZoZlJLsUbeEGX+M/jT3LLrLW6/ez0TQ5z8U4TDI1nUn+D/mEdVB4ML
qAU4/Vq5qeInneSKfR7zsWQzAcM1mZ+mpJ06lqTzQs6l2QqJ8VETVeNWAu0d7ZQEqcj9x4VG7ND2
eAt5Do87C8qdVSSYF/LMtgzUsJo0JH+uoLhva6WiXE/2W+fvw5KDjJ80JBUk37k1lTn2Cwl+ocMQ
ey38oRsxs7dO8KbBqq7su1ij03N7TT+RU3z9qUeDXBqGVD9YO2FTfnklOADpPPLtukNEfWGYbm83
pUFpkHmIIgAAAAAAAA==

--------------ms060102090603010400030508--
