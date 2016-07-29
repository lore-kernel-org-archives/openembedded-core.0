Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99313607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 14:19:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6TEJOZ8004547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jul 2016 07:19:24 -0700 (PDT)
Received: from server.local (147.11.117.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jul 2016 07:19:24 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1469638333.git.bruce.ashfield@windriver.com>
	<009dfcea9c78b09da41ed2502482b1e116772c78.1469638333.git.bruce.ashfield@windriver.com>
	<1469774922.9142.39.camel@linuxfoundation.org>
	<ebc1baa1-18d7-8de4-0edc-6213aa62eb1c@windriver.com>
	<1469793618.9142.62.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9b2bed5c-4314-efa4-fc59-3337379e2342@windriver.com>
Date: Fri, 29 Jul 2016 10:19:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469793618.9142.62.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] linux-yocto/4.1: bump to v4.1.28
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
X-List-Received-Date: Fri, 29 Jul 2016 14:19:27 -0000
X-Groupsio-MsgNum: 85121
Content-Type: multipart/mixed; boundary="------------71E63913B07F8FC070D664D8"

--------------71E63913B07F8FC070D664D8
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-29 8:00 AM, Richard Purdie wrote:
> On Fri, 2016-07-29 at 07:15 -0400, Bruce Ashfield wrote:
>> On 2016-07-29 2:48 AM, Richard Purdie wrote:
>>> On Wed, 2016-07-27 at 12:57 -0400, Bruce Ashfield wrote:
>>>> Updating the 4.1 kernel to the korg -stable release
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> ---
>>>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
>>>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
>>>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20
>>>> ++++++++++---
>>>> -------
>>>>  3 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb
>>> /bui
>>> lds/851/steps/BuildImages/logs/stdio
>>>
>>> http://errors.yoctoproject.org/Errors/Details/73456/
>>>
>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
>>>> -lsb/build/build/tmp/work-shared/qemumips/kernel
>>>> -source/arch/mips/kernel/setup.c: In function 'arch_mem_init':
>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
>>>> -lsb/build/build/tmp/work-shared/qemumips/kernel
>>>> -source/arch/mips/kernel/setup.c:690:2: error: implicit
>>>> declaration of function 'reserve_bootmem_region' [
>>>> -Werror=implicit-function-declaration]
>>>>   reserve_bootmem_region(__pa_symbol(&__nosave_begin),
>>>>   ^~~~~~~~~~~~~~~~~~~~~~
>>>>   CC      mm/swap.o
>>>> cc1: all warnings being treated as errors
>>>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips
>>>> -lsb/build/build/tmp/work-shared/qemumips/kernel
>>>> -source/scripts/Makefile.build:258: recipe for target
>>>> 'arch/mips/kernel/setup.o' failed
>>>> make[4]: *** [arch/mips/kernel/setup.o] Error 1
>>>> make[4]: *** Waiting for unfinished jobs....
>>>
>>> also
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/
>>> buil
>>> ds/857/steps/BuildImages/logs/stdio
>>>
>>> http://errors.yoctoproject.org/Errors/Details/73450/
>>>
>>> TOPDIR/tmp/work-shared/qemuppc/kernel
>>> -source/arch/powerpc/kernel/prom.c:170:25: error:
>>> 'PPC_FEATURE2_HTM_NOSC_COMP' undeclared here (not in a function)
>>>    PPC_FEATURE2_HTM_COMP|PPC_FEATURE2_HTM_NOSC_COMP, 22, 0, 0},
>>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>> make[3]: *** [arch/powerpc/kernel/prom.o] Error 1
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[2]: *** [arch/powerpc/kernel] Error 2
>>> make[1]: *** [sub-make] Error 2
>>> make: *** [__sub-make] Error 2
>>
>> odd. My core-image-builds claim to have worked. I'll pick this up and
>> re-submit my queue with some new 4.1 patches that fix any issues.
>
> I've dropped the 4.1 patches from the test queue, I left the 4.4 ones
> in since those seem ok and hopefully pull back a bit of performance so
> you may not need to resubmit those.

Looks like -stable broke both ppc and mips builds for some platforms.
There was a patch missing for ppc and a partial backport on mips.

I added the extra patch and reverted the offending mips commit.

I pushed the attached patch to the end of my zedd/kernel queue on
poky-contrib.

Bruce

>
> Cheers,
>
> Richard
>


--------------71E63913B07F8FC070D664D8
Content-Type: application/mbox;
	name="0001-linux-yocto-4.1-qemuppc-and-qemumips-build-fixes.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="0001-linux-yocto-4.1-qemuppc-and-qemumips-build-fixes.patch"

RnJvbSAzYjc5MTIzMDU4MjMzOTEwOTU2Yjk5MGJjYzNkZDA2YmI2MzY1YTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogRnJpLCAyOSBKdWwgMjAxNiAxMDowNjo1OSAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpbnV4LXlvY3RvLzQuMTogcWVtdXBwYyBhbmQgcWVtdW1pcHMgYnVpbGQgZml4ZXMK
ClRoZSB2NC4xLjI4IC1zdGFibGUgdXBkYXRlIGJyb2tlIHRoZSBidWlsZCBmb3Igc29tZSBwcGMg
YW5kIG1pcHMKcGxhdGZvcm1zLiBXZSBmaXggdGhlIGVycm9ycyBieSBiYWNrcG9ydGluZyBhIG1p
c3NpbmcgY29tbWl0IGZvcgpwcGM6CgogIHBvd2VycGMvdG06IEFib3J0IHN5c2NhbGxzIGluIGFj
dGl2ZSB0cmFuc2FjdGlvbnMKCkFuZCBieSByZXZlcnRpbmcgYSBjb21taXQgZm9yIG1pcHMgKHJh
dGhlciB0aGFuIGJhY2twb3J0aW5nIG1vcmUKY2hhbmdlcyB0byAtbW0pOgoKICBSZXZlcnQgIk1J
UFM6IFJlc2VydmUgbm9zYXZlIGRhdGEgZm9yIGhpYmVybmF0aW9uIgoKU2lnbmVkLW9mZi1ieTog
QnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQHdpbmRyaXZlci5jb20+Ci0tLQogbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjEuYmIgICB8IDIgKy0KIG1ldGEv
cmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV80LjEuYmIgfCAyICstCiBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzQuMS5iYiAgICAgIHwgOCArKysrLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF80LjEuYmIg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzQuMS5iYgppbmRleCA0
OTE1NzkwMmFiNTkuLjQxNzEwNjIxNzI4MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9saW51eC9saW51eC15b2N0by1ydF80LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
aW51eC9saW51eC15b2N0by1ydF80LjEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgcHl0aG9uICgpIHsK
IH0KIAogU1JDUkVWX21hY2hpbmUgPz0gIjBiNjg0OTg3ODRkYTVkZWZiNzY1ODY3NWUzN2Q5YmM2
MTVjZDRjNTAiCi1TUkNSRVZfbWV0YSA/PSAiYWZiYzZiZDAwZTZmYTg1NGFlMTBlYjY3YWI4YzNi
ZTUxMTJmNmY0MSIKK1NSQ1JFVl9tZXRhID89ICIwZDZkZTYzZDQ2MDNiOWNjM2E0YTY4MzkxYmNi
NTE1NmI5YjBjZjk2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2xp
bnV4LXlvY3RvLTQuMS5naXQ7YnJhbmNoPSR7S0JSQU5DSH07bmFtZT1tYWNoaW5lIFwKICAgICAg
ICAgICAgZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8ta2VybmVsLWNhY2hlO3R5cGU9
a21ldGE7bmFtZT1tZXRhO2JyYW5jaD15b2N0by00LjE7ZGVzdHN1ZmZpeD0ke0tNRVRBfSIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV80LjEu
YmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfNC4xLmJiCmlu
ZGV4IDkxODdmODU0Mjk3NS4uMDhiOTMxY2E5ZmY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV80LjEuYmIKQEAgLTEwLDcgKzEwLDcgQEAgS01F
VEEgPSAia2VybmVsLW1ldGEiCiBLQ09ORl9CU1BfQVVESVRfTEVWRUwgPSAiMiIKIAogU1JDUkVW
X21hY2hpbmUgPz0gIjQ0YWY5MDA3MTYyMDZkNGNhZTI4M2FhNzRlOTJmNDExODcyMDcyNGEiCi1T
UkNSRVZfbWV0YSA/PSAiYWZiYzZiZDAwZTZmYTg1NGFlMTBlYjY3YWI4YzNiZTUxMTJmNmY0MSIK
K1NSQ1JFVl9tZXRhID89ICIwZDZkZTYzZDQ2MDNiOWNjM2E0YTY4MzkxYmNiNTE1NmI5YjBjZjk2
IgogCiBQViA9ICIke0xJTlVYX1ZFUlNJT059K2dpdCR7U1JDUFZ9IgogCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzQuMS5iYiBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNC4xLmJiCmluZGV4IGZiMTBmNDA4MTFhMy4uZWYz
ZDAwMGEyZjZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlv
Y3RvXzQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzQu
MS5iYgpAQCAtMTMsMTMgKzEzLDEzIEBAIEtCUkFOQ0hfcWVtdW1pcHM2NCA/PSAic3RhbmRhcmQv
bXRpLW1hbHRhNjQiCiAKIFNSQ1JFVl9tYWNoaW5lX3FlbXVhcm0gPz0gIjQ2MDM0MGYyOGRkNGVk
NjA4ZmQ2NjY5MmJjYmFjMGJiMjRmZTRhYWYiCiBTUkNSRVZfbWFjaGluZV9xZW11YXJtNjQgPz0g
IjQ0YWY5MDA3MTYyMDZkNGNhZTI4M2FhNzRlOTJmNDExODcyMDcyNGEiCi1TUkNSRVZfbWFjaGlu
ZV9xZW11bWlwcyA/PSAiOWI5MzM3YWExNTZiZDNiY2YzZTgxMzQ1NWU0YmJkYzI4OTVjNGRhMSIK
LVNSQ1JFVl9tYWNoaW5lX3FlbXVwcGMgPz0gIjQ0YWY5MDA3MTYyMDZkNGNhZTI4M2FhNzRlOTJm
NDExODcyMDcyNGEiCitTUkNSRVZfbWFjaGluZV9xZW11bWlwcyA/PSAiMGZmMjFiMmE1ZTkyZGVm
YTMyYjdjYjc2ZDM5OTgwYjYzYTJlYjVjYSIKK1NSQ1JFVl9tYWNoaW5lX3FlbXVwcGMgPz0gIjZi
ZDI4NzJjZTdlMzk3ZDI4NWY3ZGYwMGY0ZDBlZmFjMjg2ZTI0MDEiCiBTUkNSRVZfbWFjaGluZV9x
ZW11eDg2ID89ICI0NGFmOTAwNzE2MjA2ZDRjYWUyODNhYTc0ZTkyZjQxMTg3MjA3MjRhIgogU1JD
UkVWX21hY2hpbmVfcWVtdXg4Ni02NCA/PSAiNDRhZjkwMDcxNjIwNmQ0Y2FlMjgzYWE3NGU5MmY0
MTE4NzIwNzI0YSIKLVNSQ1JFVl9tYWNoaW5lX3FlbXVtaXBzNjQgPz0gImNiMDNiYjkyZWQ0ZDQ1
YzU1ZTdhOGVjZmNjYTcxNGY5ODk3ZGE5NmIiCitTUkNSRVZfbWFjaGluZV9xZW11bWlwczY0ID89
ICIyNDg4NjE5ODViNjA5ZDFjZDI0ZThkMjNiN2QxNWFiZmIzMWNiZGMyIgogU1JDUkVWX21hY2hp
bmUgPz0gIjQ0YWY5MDA3MTYyMDZkNGNhZTI4M2FhNzRlOTJmNDExODcyMDcyNGEiCi1TUkNSRVZf
bWV0YSA/PSAiYWZiYzZiZDAwZTZmYTg1NGFlMTBlYjY3YWI4YzNiZTUxMTJmNmY0MSIKK1NSQ1JF
Vl9tZXRhID89ICIwZDZkZTYzZDQ2MDNiOWNjM2E0YTY4MzkxYmNiNTE1NmI5YjBjZjk2IgogCiBT
UkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2xpbnV4LXlvY3RvLTQuMS5naXQ7
bmFtZT1tYWNoaW5lO2JyYW5jaD0ke0tCUkFOQ0h9OyBcCiAgICAgICAgICAgIGdpdDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL3lvY3RvLWtlcm5lbC1jYWNoZTt0eXBlPWttZXRhO25hbWU9bWV0YTti
cmFuY2g9eW9jdG8tNC4xO2Rlc3RzdWZmaXg9JHtLTUVUQX0iCi0tIAoyLjUuMAoK

--------------71E63913B07F8FC070D664D8--
