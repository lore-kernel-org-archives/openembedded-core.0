Return-Path: <ftoth@telfort.nl>
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
	by mail.openembedded.org (Postfix) with ESMTP id A790E7C186
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:06:32 +0000 (UTC)
Received: from [192.168.1.22] (cust-178-250-146-69.breedbanddelft.nl
	[178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 064CA2404C;
	Fri, 11 Jan 2019 17:06:33 +0100 (CET)
To: Marek Vasut <marek.vasut@gmail.com>, akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <bb4e7e77-fc77-d180-cf50-aecc92c42c24@telfort.nl>
	<af7fc6ac-01d9-8132-6ca7-1586afc3bc57@gmail.com>
	<34a5a2d4-f6bc-328d-d535-54dcbf55af28@gmail.com>
	<b1c588b5-ce46-618d-3013-56aa2909c79b@gmail.com>
From: Ferry Toth <ftoth@telfort.nl>
Message-ID: <b117b79e-dd9a-e240-9fe8-cfd5f2acb6ae@telfort.nl>
Date: Fri, 11 Jan 2019 17:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b1c588b5-ce46-618d-3013-56aa2909c79b@gmail.com>
Subject: Re: Sudden errors building Sumo
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
X-List-Received-Date: Fri, 11 Jan 2019 16:06:33 -0000
X-Groupsio-MsgNum: 119967
Content-Type: multipart/mixed; boundary="------------FD903ECFB95E9FC48C907DEA"
Content-Language: en-US

--------------FD903ECFB95E9FC48C907DEA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Op 10-01-19 om 21:52 schreef Marek Vasut:
> On 1/10/19 9:49 PM, Marek Vasut wrote:
>> On 1/10/19 9:48 PM, akuster808 wrote:
>>>
>>> On 1/10/19 8:23 AM, Ferry Toth wrote:
>>>> After a new checkout I am experiencing multiple errors building Sumo
>>>> that might be related:
>>>> bison-3.0.4
>>>>
>>>> cross-localedef-native_2.27
>>>>
>>>> coreutils-8.29
>>>>
>>>> On another machine with slightly out-of-date Sumo these problems do
>>>> not occur.
>>>>
>>>>
>>>> Detail below.
>>>>
>>>>
>>>> Any ideas how to fix?
>>> Can you provide how you are building this ie, local.conf, MACHINE and host
>>>
>>> What are your before and after commit hashes used?
>>>
>>> - armin
>>>> Ferry
>>>>
>>>>
>>>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-devtools/bison/bison_3.0.4.bb:do_compile
>>>>
>>>>
>>>> | ../bison-3.0.4/lib/fseterr.c: In function 'fseterr':
>>>> | ../bison-3.0.4/lib/fseterr.c:77:3: error: #error "Please port gnulib
>>>> fseterr.c to your platform! Look at the definitions of ferror and
>>>> clearerr on your system, then report this to bug-gnulib."
>>>> | #error "Please port gnulib fseterr.c to your platform! Look at the
>>>> definitions of ferror and clearerr on your system, then report this to
>>>> bug-gnulib."
>>>> | ^~~~~
>>>>
>>>>
>>>> /home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/glibc/cross-localedef-native_2.27.bb:do_compile
>>>>
>>>>
>>>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>>>> argp-fmtstream.c:(.text+0x525): undefined reference to `_IO_fwide'
>>>> | /home/ferry/Develop/tmp/out/linux64/build/tmp/hosttools/ld:
>>>> argp-help.o: in function `argp_failure':
>>>> | argp-help.c:(.text+0x20b3): undefined reference to `_IO_fwide'
>>>> | collect2: error: ld returned 1 exit status
>>>>
>>>>
>>>> virtual:native:/home/ferry/Develop/tmp/out/linux64/poky/meta/recipes-core/coreutils/coreutils_8.29.bb:do_compile
>>>>
>>>>
>>>> | ../coreutils-8.29/lib/freadseek.c: In function 'freadptrinc':
>>>> | ../coreutils-8.29/lib/freadseek.c:68:3: error: #error "Please port
>>>> gnulib freadseek.c to your platform! Look at the definition of getc,
>>>> getc_unlocked on your system, then report this to bug-gnulib."
>>>> | #error "Please port gnulib freadseek.c to your platform! Look at the
>>>> definition of getc, getc_unlocked on your system, then report this to
>>>> bug-gnulib."
>>>> | ^~~~~
>> Sounds like one of those glibc-2.28 problems ?
> Oh, in fact, I have this fixed locally, didn't get to sending the
> patches out, see the two attached patches. One is backport from
> oe-core/master , the other is something I grab'd from who knows where,
> feel free to tweak the patches and post them.
>
Thanks, no need to tweak them. The 2 patches solve 2 of the above errors.

For the 3rd (coreutils-native) I created asimilar patch, which fixes the 
build (see attached).

I haven't run-time tested the result. Hope to do that tonight.


--------------FD903ECFB95E9FC48C907DEA
Content-Type: text/plain; charset=utf-8;
 name="0001-PATCH-coreutils-Fix-build-break-with-glibc-2.28.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="0001-PATCH-coreutils-Fix-build-break-with-glibc-2.28.patch"

RnJvbSBlNjE5YTU1YzBhMjk5YTU5ZjMyMTdhZDE0NWE1YjY5NDI4YThlMzdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZXJyeSBUb3RoIDxmdG90aEBleGFsb25kZWxmdC5ubD4KRGF0
ZTogRnJpLCAxMSBKYW4gMjAxOSAxNjowMDo1OCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIFtQQVRD
SF0gY29yZXV0aWxzOiBGaXggYnVpbGQgYnJlYWsgd2l0aCBnbGliYyAyLjI4CgpFeHBvc2VkIHdo
ZW4gYnVpbGRpbmcgc3VtbyBvbiBVYnVudHUgMTguMTAKClNpZ25lZC1vZmYtYnk6IEZlcnJ5IFRv
dGggPGZ0b3RoQGV4YWxvbmRlbGZ0Lm5sPgotLS0KIC4uLi9jb3JldXRpbHMvY29yZXV0aWxzL3N1
bW8ucGF0Y2ggICAgICAgICAgICB8IDE1MSArKysrKysrKysrKysrKysrKysKIG1ldGEvcmVjaXBl
cy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOC4yOS5iYiB8ICAgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDE1MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3NTUgbWV0YS9yZWNpcGVzLWNv
cmUvY29yZXV0aWxzL2NvcmV1dGlscy9zdW1vLnBhdGNoCiBtb2RlIGNoYW5nZSAxMDA2NDQgPT4g
MTAwNzU1IG1ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOC4yOS5iYgoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvc3Vtby5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvc3Vtby5wYXRjaApuZXcg
ZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMDAwLi4wM2NmM2MxYjUyCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy9zdW1vLnBhdGNo
CkBAIC0wLDAgKzEsMTUxIEBACitkaWZmIC11ciBjb3JldXRpbHMtOC4yOS9saWIvZmZsdXNoLmMg
Y29yZXV0aWxzLTguMjktbW9kL2xpYi9mZmx1c2guYworLS0tIGNvcmV1dGlscy04LjI5L2xpYi9m
Zmx1c2guYwkyMDE5LTAxLTExIDE1OjEwOjQ5Ljc5MjA0NzAzMSArMDEwMAorKysrIGNvcmV1dGls
cy04LjI5LW1vZC9saWIvZmZsdXNoLmMJMjAxOS0wMS0xMSAxNTo1MToxOC44MzE3OTYxNTIgKzAx
MDAKK0BAIC0zMyw3ICszMyw3IEBACisgI3VuZGVmIGZmbHVzaAorIAorIAorLSNpZiBkZWZpbmVk
IF9JT19mdHJ5bG9ja2ZpbGUgfHwgX19HTlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJl
T1MsIEhhaWt1LCBMaW51eCBsaWJjNSAqLworKyNpZiBkZWZpbmVkIF9JT19FT0ZfU0VFTiB8fCBf
X0dOVV9MSUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1
ICovCisgCisgLyogQ2xlYXIgdGhlIHN0cmVhbSdzIHVuZ2V0YyBidWZmZXIsIHByZXNlcnZpbmcg
dGhlIHZhbHVlIG9mIGZ0ZWxsbyAoZnApLiAgKi8KKyBzdGF0aWMgdm9pZAorQEAgLTcyLDcgKzcy
LDcgQEAKKyAKKyAjZW5kaWYKKyAKKy0jaWYgISAoZGVmaW5lZCBfSU9fZnRyeWxvY2tmaWxlIHx8
IF9fR05VX0xJQlJBUllfXyA9PSAxIC8qIEdOVSBsaWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGli
YzUgKi8pCisrI2lmICEgKGRlZmluZWQgX0lPX0VPRl9TRUVOIHx8IF9fR05VX0xJQlJBUllfXyA9
PSAxIC8qIEdOVSBsaWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGliYzUgKi8pCisgCisgIyBpZiAo
ZGVmaW5lZCBfX3NmZXJyb3IgfHwgZGVmaW5lZCBfX0RyYWdvbkZseV9fIHx8IGRlZmluZWQgX19B
TkRST0lEX18pICYmIGRlZmluZWQgX19TTlBUCisgLyogRnJlZUJTRCwgTmV0QlNELCBPcGVuQlNE
LCBEcmFnb25GbHksIE1hYyBPUyBYLCBDeWd3aW4sIE1pbml4IDMsIEFuZHJvaWQgKi8KK0BAIC0x
NDgsNyArMTQ4LDcgQEAKKyAgIGlmIChzdHJlYW0gPT0gTlVMTCB8fCAhIGZyZWFkaW5nIChzdHJl
YW0pKQorICAgICByZXR1cm4gZmZsdXNoIChzdHJlYW0pOworIAorLSNpZiBkZWZpbmVkIF9JT19m
dHJ5bG9ja2ZpbGUgfHwgX19HTlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhh
aWt1LCBMaW51eCBsaWJjNSAqLworKyNpZiBkZWZpbmVkIF9JT19FT0ZfU0VFTiB8fCBfX0dOVV9M
SUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1ICovCisg
CisgICBjbGVhcl91bmdldGNfYnVmZmVyX3ByZXNlcnZpbmdfcG9zaXRpb24gKHN0cmVhbSk7Cisg
CitkaWZmIC11ciBjb3JldXRpbHMtOC4yOS9saWIvZnBlbmRpbmcuYyBjb3JldXRpbHMtOC4yOS1t
b2QvbGliL2ZwZW5kaW5nLmMKKy0tLSBjb3JldXRpbHMtOC4yOS9saWIvZnBlbmRpbmcuYwkyMDE5
LTAxLTExIDE1OjEwOjUwLjcxMTI2OTg0NSArMDEwMAorKysrIGNvcmV1dGlscy04LjI5LW1vZC9s
aWIvZnBlbmRpbmcuYwkyMDE5LTAxLTExIDE1OjUwOjExLjE1MzIzMjc0MyArMDEwMAorQEAgLTMy
LDcgKzMyLDcgQEAKKyAgIC8qIE1vc3Qgc3lzdGVtcyBwcm92aWRlIEZJTEUgYXMgYSBzdHJ1Y3Qg
YW5kIHRoZSBuZWNlc3NhcnkgYml0bWFzayBpbgorICAgICAgPHN0ZGlvLmg+LCBiZWNhdXNlIHRo
ZXkgbmVlZCBpdCBmb3IgaW1wbGVtZW50aW5nIGdldGMoKSBhbmQgcHV0YygpIGFzCisgICAgICBm
YXN0IG1hY3Jvcy4gICovCistI2lmIGRlZmluZWQgX0lPX2Z0cnlsb2NrZmlsZSB8fCBfX0dOVV9M
SUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1ICovCisr
I2lmIGRlZmluZWQgX0lPX0VPRl9TRUVOIHx8IF9fR05VX0xJQlJBUllfXyA9PSAxIC8qIEdOVSBs
aWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGliYzUgKi8KKyAgIHJldHVybiBmcC0+X0lPX3dyaXRl
X3B0ciAtIGZwLT5fSU9fd3JpdGVfYmFzZTsKKyAjZWxpZiBkZWZpbmVkIF9fc2ZlcnJvciB8fCBk
ZWZpbmVkIF9fRHJhZ29uRmx5X18gfHwgZGVmaW5lZCBfX0FORFJPSURfXworICAgLyogRnJlZUJT
RCwgTmV0QlNELCBPcGVuQlNELCBEcmFnb25GbHksIE1hYyBPUyBYLCBDeWd3aW4sIE1pbml4IDMs
IEFuZHJvaWQgKi8KK2RpZmYgLXVyIGNvcmV1dGlscy04LjI5L2xpYi9mcHVyZ2UuYyBjb3JldXRp
bHMtOC4yOS1tb2QvbGliL2ZwdXJnZS5jCistLS0gY29yZXV0aWxzLTguMjkvbGliL2ZwdXJnZS5j
CTIwMTktMDEtMTEgMTU6MTA6NTYuNjk5ODEyNTQwICswMTAwCisrKysgY29yZXV0aWxzLTguMjkt
bW9kL2xpYi9mcHVyZ2UuYwkyMDE5LTAxLTExIDE1OjUwOjEyLjU1MjI0MjQ2MSArMDEwMAorQEAg
LTYyLDcgKzYyLDcgQEAKKyAgIC8qIE1vc3Qgc3lzdGVtcyBwcm92aWRlIEZJTEUgYXMgYSBzdHJ1
Y3QgYW5kIHRoZSBuZWNlc3NhcnkgYml0bWFzayBpbgorICAgICAgPHN0ZGlvLmg+LCBiZWNhdXNl
IHRoZXkgbmVlZCBpdCBmb3IgaW1wbGVtZW50aW5nIGdldGMoKSBhbmQgcHV0YygpIGFzCisgICAg
ICBmYXN0IG1hY3Jvcy4gICovCistIyBpZiBkZWZpbmVkIF9JT19mdHJ5bG9ja2ZpbGUgfHwgX19H
TlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1LCBMaW51eCBsaWJjNSAq
LworKyMgaWYgZGVmaW5lZCBfSU9fRU9GX1NFRU4gfHwgX19HTlVfTElCUkFSWV9fID09IDEgLyog
R05VIGxpYmMsIEJlT1MsIEhhaWt1LCBMaW51eCBsaWJjNSAqLworICAgZnAtPl9JT19yZWFkX2Vu
ZCA9IGZwLT5fSU9fcmVhZF9wdHI7CisgICBmcC0+X0lPX3dyaXRlX3B0ciA9IGZwLT5fSU9fd3Jp
dGVfYmFzZTsKKyAgIC8qIEF2b2lkIG1lbW9yeSBsZWFrIHdoZW4gdGhlcmUgaXMgYW4gYWN0aXZl
IHVuZ2V0YyBidWZmZXIuICAqLworZGlmZiAtdXIgY29yZXV0aWxzLTguMjkvbGliL2ZyZWFkYWhl
YWQuYyBjb3JldXRpbHMtOC4yOS1tb2QvbGliL2ZyZWFkYWhlYWQuYworLS0tIGNvcmV1dGlscy04
LjI5L2xpYi9mcmVhZGFoZWFkLmMJMjAxOS0wMS0xMSAxNToxMTowMy4zMDEyNDkwODggKzAxMDAK
KysrKyBjb3JldXRpbHMtOC4yOS1tb2QvbGliL2ZyZWFkYWhlYWQuYwkyMDE5LTAxLTExIDE1OjUw
OjEzLjgyNjk5Mzc0OSArMDEwMAorQEAgLTMwLDcgKzMwLDcgQEAKKyBzaXplX3QKKyBmcmVhZGFo
ZWFkIChGSUxFICpmcCkKKyB7CistI2lmIGRlZmluZWQgX0lPX2Z0cnlsb2NrZmlsZSB8fCBfX0dO
VV9MSUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1ICov
CisrI2lmIGRlZmluZWQgX0lPX0VPRl9TRUVOIHx8IF9fR05VX0xJQlJBUllfXyA9PSAxIC8qIEdO
VSBsaWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGliYzUgKi8KKyAgIGlmIChmcC0+X0lPX3dyaXRl
X3B0ciA+IGZwLT5fSU9fd3JpdGVfYmFzZSkKKyAgICAgcmV0dXJuIDA7CisgICByZXR1cm4gKGZw
LT5fSU9fcmVhZF9lbmQgLSBmcC0+X0lPX3JlYWRfcHRyKQorZGlmZiAtdXIgY29yZXV0aWxzLTgu
MjkvbGliL2ZyZWFkaW5nLmMgY29yZXV0aWxzLTguMjktbW9kL2xpYi9mcmVhZGluZy5jCistLS0g
Y29yZXV0aWxzLTguMjkvbGliL2ZyZWFkaW5nLmMJMjAxOS0wMS0xMSAxNToxMTowMi44MTI1MTE1
NTAgKzAxMDAKKysrKyBjb3JldXRpbHMtOC4yOS1tb2QvbGliL2ZyZWFkaW5nLmMJMjAxOS0wMS0x
MSAxNTo1MDoyMS4zOTI3NzIxMjMgKzAxMDAKK0BAIC0zMSw3ICszMSw3IEBACisgICAvKiBNb3N0
IHN5c3RlbXMgcHJvdmlkZSBGSUxFIGFzIGEgc3RydWN0IGFuZCB0aGUgbmVjZXNzYXJ5IGJpdG1h
c2sgaW4KKyAgICAgIDxzdGRpby5oPiwgYmVjYXVzZSB0aGV5IG5lZWQgaXQgZm9yIGltcGxlbWVu
dGluZyBnZXRjKCkgYW5kIHB1dGMoKSBhcworICAgICAgZmFzdCBtYWNyb3MuICAqLworLSMgaWYg
ZGVmaW5lZCBfSU9fZnRyeWxvY2tmaWxlIHx8IF9fR05VX0xJQlJBUllfXyA9PSAxIC8qIEdOVSBs
aWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGliYzUgKi8KKysjIGlmIGRlZmluZWQgX0lPX0VPRl9T
RUVOIHx8IF9fR05VX0xJQlJBUllfXyA9PSAxIC8qIEdOVSBsaWJjLCBCZU9TLCBIYWlrdSwgTGlu
dXggbGliYzUgKi8KKyAgIHJldHVybiAoKGZwLT5fZmxhZ3MgJiBfSU9fTk9fV1JJVEVTKSAhPSAw
CisgICAgICAgICAgIHx8ICgoZnAtPl9mbGFncyAmIChfSU9fTk9fUkVBRFMgfCBfSU9fQ1VSUkVO
VExZX1BVVFRJTkcpKSA9PSAwCisgICAgICAgICAgICAgICAmJiBmcC0+X0lPX3JlYWRfYmFzZSAh
PSBOVUxMKSk7CitkaWZmIC11ciBjb3JldXRpbHMtOC4yOS9saWIvZnJlYWRwdHIuYyBjb3JldXRp
bHMtOC4yOS1tb2QvbGliL2ZyZWFkcHRyLmMKKy0tLSBjb3JldXRpbHMtOC4yOS9saWIvZnJlYWRw
dHIuYwkyMDE5LTAxLTExIDE1OjEwOjU2LjA1OTAxMDA4OSArMDEwMAorKysrIGNvcmV1dGlscy04
LjI5LW1vZC9saWIvZnJlYWRwdHIuYwkyMDE5LTAxLTExIDE0OjQ5OjU0LjI5MzQ1NTk4MCArMDEw
MAorQEAgLTI5LDcgKzI5LDcgQEAKKyAgIHNpemVfdCBzaXplOworIAorICAgLyogS2VlcCB0aGlz
IGNvZGUgaW4gc3luYyB3aXRoIGZyZWFkYWhlYWQhICAqLworLSNpZiBkZWZpbmVkIF9JT19mdHJ5
bG9ja2ZpbGUgfHwgX19HTlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1
LCBMaW51eCBsaWJjNSAqLworKyNpZiBkZWZpbmVkIF9JT19FT0ZfU0VFTiB8fCBfX0dOVV9MSUJS
QVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1ICovCisgICBp
ZiAoZnAtPl9JT193cml0ZV9wdHIgPiBmcC0+X0lPX3dyaXRlX2Jhc2UpCisgICAgIHJldHVybiBO
VUxMOworICAgc2l6ZSA9IGZwLT5fSU9fcmVhZF9lbmQgLSBmcC0+X0lPX3JlYWRfcHRyOworZGlm
ZiAtdXIgY29yZXV0aWxzLTguMjkvbGliL2ZyZWFkc2Vlay5jIGNvcmV1dGlscy04LjI5LW1vZC9s
aWIvZnJlYWRzZWVrLmMKKy0tLSBjb3JldXRpbHMtOC4yOS9saWIvZnJlYWRzZWVrLmMJMjAxOS0w
MS0xMSAxNToxMDo1MC4yMjA4ODg3MjcgKzAxMDAKKysrKyBjb3JldXRpbHMtOC4yOS1tb2QvbGli
L2ZyZWFkc2Vlay5jCTIwMTktMDEtMTEgMTU6NDk6MDEuMTcwNjMwMTU2ICswMTAwCitAQCAtMzYs
NyArMzYsNyBAQAorICAgLyogS2VlcCB0aGlzIGNvZGUgaW4gc3luYyB3aXRoIGZyZWFkcHRyISAg
Ki8KKyAjaWYgSEFWRV9fX0ZSRUFEUFRSSU5DICAgICAgICAgICAgICAvKiBtdXNsIGxpYmMgKi8K
KyAgIF9fZnJlYWRwdHJpbmMgKGZwLCBpbmNyZW1lbnQpOworLSNlbGlmIGRlZmluZWQgX0lPX2Z0
cnlsb2NrZmlsZSB8fCBfX0dOVV9MSUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywgSGFp
a3UsIExpbnV4IGxpYmM1ICovCisrI2VsaWYgZGVmaW5lZCBfSU9fRU9GX1NFRU4gfHwgX19HTlVf
TElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1LCBMaW51eCBsaWJjNSAqLwor
ICAgZnAtPl9JT19yZWFkX3B0ciArPSBpbmNyZW1lbnQ7CisgI2VsaWYgZGVmaW5lZCBfX3NmZXJy
b3IgfHwgZGVmaW5lZCBfX0RyYWdvbkZseV9fIHx8IGRlZmluZWQgX19BTkRST0lEX18KKyAgIC8q
IEZyZWVCU0QsIE5ldEJTRCwgT3BlbkJTRCwgRHJhZ29uRmx5LCBNYWMgT1MgWCwgQ3lnd2luLCBN
aW5peCAzLCBBbmRyb2lkICovCitkaWZmIC11ciBjb3JldXRpbHMtOC4yOS9saWIvZnNlZWtvLmMg
Y29yZXV0aWxzLTguMjktbW9kL2xpYi9mc2Vla28uYworLS0tIGNvcmV1dGlscy04LjI5L2xpYi9m
c2Vla28uYwkyMDE5LTAxLTExIDE1OjEwOjU2Ljg0MDE3MTM1NSArMDEwMAorKysrIGNvcmV1dGls
cy04LjI5LW1vZC9saWIvZnNlZWtvLmMJMjAxOS0wMS0xMSAxNTo1MToyOC4yNjA0MjQxMjAgKzAx
MDAKK0BAIC00Nyw3ICs0Nyw3IEBACisgI2VuZGlmCisgCisgICAvKiBUaGVzZSB0ZXN0cyBhcmUg
YmFzZWQgb24gZnB1cmdlLmMuICAqLworLSNpZiBkZWZpbmVkIF9JT19mdHJ5bG9ja2ZpbGUgfHwg
X19HTlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1LCBMaW51eCBsaWJj
NSAqLworKyNpZiBkZWZpbmVkIF9JT19FT0ZfU0VFTiB8fCBfX0dOVV9MSUJSQVJZX18gPT0gMSAv
KiBHTlUgbGliYywgQmVPUywgSGFpa3UsIExpbnV4IGxpYmM1ICovCisgICBpZiAoZnAtPl9JT19y
ZWFkX2VuZCA9PSBmcC0+X0lPX3JlYWRfcHRyCisgICAgICAgJiYgZnAtPl9JT193cml0ZV9wdHIg
PT0gZnAtPl9JT193cml0ZV9iYXNlCisgICAgICAgJiYgZnAtPl9JT19zYXZlX2Jhc2UgPT0gTlVM
TCkKK0BAIC0xMjMsNyArMTIzLDcgQEAKKyAgICAgICAgICAgcmV0dXJuIC0xOworICAgICAgICAg
fQorIAorLSNpZiBkZWZpbmVkIF9JT19mdHJ5bG9ja2ZpbGUgfHwgX19HTlVfTElCUkFSWV9fID09
IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1LCBMaW51eCBsaWJjNSAqLworKyNpZiBkZWZpbmVk
IF9JT19FT0ZfU0VFTiB8fCBfX0dOVV9MSUJSQVJZX18gPT0gMSAvKiBHTlUgbGliYywgQmVPUywg
SGFpa3UsIExpbnV4IGxpYmM1ICovCisgICAgICAgZnAtPl9mbGFncyAmPSB+X0lPX0VPRl9TRUVO
OworICAgICAgIGZwLT5fb2Zmc2V0ID0gcG9zOworICNlbGlmIGRlZmluZWQgX19zZmVycm9yIHx8
IGRlZmluZWQgX19EcmFnb25GbHlfXyB8fCBkZWZpbmVkIF9fQU5EUk9JRF9fCitkaWZmIC11ciBj
b3JldXRpbHMtOC4yOS9saWIvZnNldGVyci5jIGNvcmV1dGlscy04LjI5LW1vZC9saWIvZnNldGVy
ci5jCistLS0gY29yZXV0aWxzLTguMjkvbGliL2ZzZXRlcnIuYwkyMDE5LTAxLTExIDE1OjEwOjU1
Ljk5NjM3NDA5NiArMDEwMAorKysrIGNvcmV1dGlscy04LjI5LW1vZC9saWIvZnNldGVyci5jCTIw
MTktMDEtMTEgMTQ6NDk6NTQuMjY4NjY0OTAzICswMTAwCitAQCAtMjksNyArMjksNyBAQAorICAg
LyogTW9zdCBzeXN0ZW1zIHByb3ZpZGUgRklMRSBhcyBhIHN0cnVjdCBhbmQgdGhlIG5lY2Vzc2Fy
eSBiaXRtYXNrIGluCisgICAgICA8c3RkaW8uaD4sIGJlY2F1c2UgdGhleSBuZWVkIGl0IGZvciBp
bXBsZW1lbnRpbmcgZ2V0YygpIGFuZCBwdXRjKCkgYXMKKyAgICAgIGZhc3QgbWFjcm9zLiAgKi8K
Ky0jaWYgZGVmaW5lZCBfSU9fZnRyeWxvY2tmaWxlIHx8IF9fR05VX0xJQlJBUllfXyA9PSAxIC8q
IEdOVSBsaWJjLCBCZU9TLCBIYWlrdSwgTGludXggbGliYzUgKi8KKysjaWYgZGVmaW5lZCBfSU9f
RU9GX1NFRU4gfHwgX19HTlVfTElCUkFSWV9fID09IDEgLyogR05VIGxpYmMsIEJlT1MsIEhhaWt1
LCBMaW51eCBsaWJjNSAqLworICAgZnAtPl9mbGFncyB8PSBfSU9fRVJSX1NFRU47CisgI2VsaWYg
ZGVmaW5lZCBfX3NmZXJyb3IgfHwgZGVmaW5lZCBfX0RyYWdvbkZseV9fIHx8IGRlZmluZWQgX19B
TkRST0lEX18KKyAgIC8qIEZyZWVCU0QsIE5ldEJTRCwgT3BlbkJTRCwgRHJhZ29uRmx5LCBNYWMg
T1MgWCwgQ3lnd2luLCBNaW5peCAzLCBBbmRyb2lkICovCitkaWZmIC11ciBjb3JldXRpbHMtOC4y
OS9saWIvc3RkaW8taW1wbC5oIGNvcmV1dGlscy04LjI5LW1vZC9saWIvc3RkaW8taW1wbC5oCist
LS0gY29yZXV0aWxzLTguMjkvbGliL3N0ZGlvLWltcGwuaAkyMDE5LTAxLTExIDE1OjExOjAxLjg1
MTM5NTQwMCArMDEwMAorKysrIGNvcmV1dGlscy04LjI5LW1vZC9saWIvc3RkaW8taW1wbC5oCTIw
MTktMDEtMTEgMTU6Mzg6NDMuMjY4Nzk4NDk3ICswMTAwCitAQCAtMTgsNiArMTgsMTIgQEAKKyAg
ICB0aGUgc2FtZSBpbXBsZW1lbnRhdGlvbiBvZiBzdGRpbyBleHRlbnNpb24gQVBJLCBleGNlcHQg
dGhhdCBzb21lIGZpZWxkcworICAgIGhhdmUgZGlmZmVyZW50IG5hbWluZyBjb252ZW50aW9ucywg
b3IgdGhlaXIgYWNjZXNzIHJlcXVpcmVzIHNvbWUgY2FzdHMuICAqLworIAorKy8qIEdsaWJjIDIu
MjggbWFkZSBfSU9fSU5fQkFDS1VQIHByaXZhdGUuICBGb3Igbm93LCB3b3JrIGFyb3VuZCB0aGlz
CisrICAgcHJvYmxlbSBieSBkZWZpbmluZyBpdCBvdXJzZWx2ZXMuICBGSVhNRTogRG8gbm90IHJl
bHkgb24gZ2xpYmMKKysgICBpbnRlcm5hbHMuICAqLworKyNpZiAhZGVmaW5lZCBfSU9fSU5fQkFD
S1VQICYmIGRlZmluZWQgX0lPX0VPRl9TRUVOCisrIyBkZWZpbmUgX0lPX0lOX0JBQ0tVUCAweDEw
MAorKyNlbmRpZgorIAorIC8qIEJTRCBzdGRpbyBkZXJpdmVkIGltcGxlbWVudGF0aW9ucy4gICov
CisgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzgu
MjkuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzguMjkuYmIKb2xk
IG1vZGUgMTAwNjQ0Cm5ldyBtb2RlIDEwMDc1NQppbmRleCBiMDU3MmFmZGMwLi5kNTI1YjNjM2I0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOC4yOS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzguMjkuYmIKQEAgLTIxLDYg
KzIxLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2NvcmV1dGlscy8ke0JQfS50YXIueHog
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1sb2NhbC5tay1maXgtY3Jvc3MtY29tcGlsaW5nLXBy
b2JsZW0ucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTctMTgwMTgtMS5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAxNy0xODAxOC0yLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovL3N1bW8ucGF0Y2ggXAogICAgICAgICAgICIKIAogU1JDX1VSSVttZDVzdW1dID0gIjk2
MGNmZTc1YTQyYzk5MDdjNzE0MzlmOGViNDM2MzAzIgotLSAKMi4xOS4xCgo=

--------------FD903ECFB95E9FC48C907DEA--
