Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1T43zr-0003aB-43
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 08:00:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7M5mmGv011011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2012 22:48:48 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 21 Aug 2012 22:48:48 -0700
Message-ID: <503472BF.5000306@windriver.com>
Date: Wed, 22 Aug 2012 01:48:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@intel.com>
References: <cover.1344876697.git.bruce.ashfield@windriver.com>
	<1345613248.17535.1.camel@trz-ThinkPad-T420>
In-Reply-To: <1345613248.17535.1.camel@trz-ThinkPad-T420>
Cc: openembedded-core@lists.openembedded.org, scott.a.garman@intel.com
Subject: Re: [PATCH 0/1] [denzil] linux-yocto: make validate_branches handle non BSP branches
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
X-List-Received-Date: Wed, 22 Aug 2012 06:00:55 -0000
X-Groupsio-MsgNum: 28038
Content-Type: multipart/mixed; boundary="------------030801050006020606070601"

--------------030801050006020606070601
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-08-22 1:27 AM, Tom Zanussi wrote:
> On Mon, 2012-08-13 at 13:10 -0400, Bruce Ashfield wrote:
>> Scott,
>>
>> Here's a fix for validate_branches that comes from a pending master
>> change that I've been running for 3 weeks, and one that TomZ has tested
>> in his yocto BSP work on denzil.
>>
>> It fixes some BSP use cases that involve setting a specific SRCREV
>> on a base branch, so that a BSP branch that doesn't yet exist can
>> be created off of that known base. Previously only an existing BSP
>> branch could have it's SRCREV restricted.
>>
>
> Hi Scott,
>
> I don't see this in denzil - do you have it queued for the next pull
> request, or did it get missed?

I was wondering the same thing, in particular, since I just made a minor
tweak to this in master (which I'll send out tomorrow). The attached
patch should also be merged to denzil.

Bruce

>
> Tom
>
>> cc: Tom Zanussi<tom.zanussi@intel.com>
>>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit 73cdebf60df225ee10f2eb215935be3b61e1b831:
>>
>>    documentation/dev-manual/dev-manual-kernel-appendix.xml: Add note about conflict (2012-06-29 15:54:26 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zedd/kernel-denzil
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-denzil
>>
>> Bruce Ashfield (1):
>>    linux-yocto: allow do_validate_branches to handle all branches
>>
>>   meta/classes/kernel-yocto.bbclass |  119 +++++++++++++++++++++++++------------
>>   1 files changed, 80 insertions(+), 39 deletions(-)
>>
>
>


--------------030801050006020606070601
Content-Type: application/mbox;
	name="0001-kernel-yocto-set-master-branch-to-a-defined-SRCREV.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-kernel-yocto-set-master-branch-to-a-defined-SRCREV.patc";
	filename*1="h"

RnJvbSBlMDQ0MDQwYWZlY2RlNjI0MzYyYTcyNDNjM2NiNzQ4ZWQ5ZTNmZTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogV2VkLCAyMiBBdWcgMjAxMiAwMToxODowNSAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGtlcm5lbC15b2N0bzogc2V0IG1hc3RlciBicmFuY2ggdG8gYSBkZWZpbmVkIFNSQ1JF
VgoKVG8gc3VwcG9ydCBjdXN0b20gcmVwb3NpdG9yaWVzIHRoYXQgc2V0IGEgU1JDUkVWIGFuZCB0
aGF0IG9ubHkgaGF2ZQphIHNpbmdsZSBtYXN0ZXIgYnJhbmNoLCBkb192YWxpZGF0ZV9icmFuY2hl
cyBuZWVkcyBhIHNwZWNpYWwgY2FzZQpmb3IgJ21hc3RlcicuIFdlIGNhbid0IGRlbGV0ZSBhbmQg
cmVjcmVhdGUgdGhlIGJyYW5jaCwgc2luY2UgeW91CmNhbm5vdCBkZWxldGUgdGhlIGN1cnJlbnQg
YnJhbmNoLCBpbnN0ZWFkIHdlIG11c3QgcmVzZXQgdGhlIGJyYW5jaAp0byB0aGUgcHJvcGVyIFNS
Q1JFVi4KClNpZ25lZC1vZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5k
cml2ZXIuY29tPgotLS0KIG1ldGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcyB8ICAgMTIg
KysrKysrKystLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MgYi9t
ZXRhL2NsYXNzZXMva2VybmVsLXlvY3RvLmJiY2xhc3MKaW5kZXggZDg1OWQ3Ni4uZTY3NThjZiAx
MDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC15b2N0by5iYmNsYXNzCisrKyBiL21ldGEv
Y2xhc3Nlcy9rZXJuZWwteW9jdG8uYmJjbGFzcwpAQCAtMjcwLDExICsyNzAsMTUgQEAgZG9fdmFs
aWRhdGVfYnJhbmNoZXMoKSB7CiAJIyBTUkNSRVYgKGlmIGl0IGlzbid0IHRoZSBjdXJyZW50IEhF
QUQgb2YgdGhhdCBicmFuY2gpCiAJZ2l0IGNoZWNrb3V0IC1xIG1hc3RlcgogCWZvciBiIGluICRj
b250YWluaW5nX2JyYW5jaGVzOyBkbwotCQlicmFuY2hfaGVhZD1gZ2l0IHNob3ctcmVmIC1zIC0t
aGVhZHMgJHtifWAKKwkJYnJhbmNoX2hlYWQ9YGdpdCBzaG93LXJlZiAtcyAtLWhlYWRzICR7Yn1g
CQkKIAkJaWYgWyAiJGJyYW5jaF9oZWFkIiAhPSAiJHRhcmdldF9icmFuY2hfaGVhZCIgXTsgdGhl
bgotCQkJZWNobyAiW0lORk9dIFNldHRpbmcgYnJhbmNoICRiIHRvICR7dGFyZ2V0X2JyYW5jaF9o
ZWFkfSIJICAgICAgCi0JCQlnaXQgYnJhbmNoIC1EICRiID4gL2Rldi9udWxsCi0JCQlnaXQgYnJh
bmNoICRiICR0YXJnZXRfYnJhbmNoX2hlYWQgPiAvZGV2L251bGwKKwkJCWVjaG8gIltJTkZPXSBT
ZXR0aW5nIGJyYW5jaCAkYiB0byAke3RhcmdldF9icmFuY2hfaGVhZH0iCisJCQlpZiBbICIkYiIg
PT0gIm1hc3RlciIgXTsgdGhlbgorCQkJCWdpdCByZXNldCAtLWhhcmQgJHRhcmdldF9icmFuY2hf
aGVhZCA+IC9kZXYvbnVsbAorCQkJZWxzZQorCQkJCWdpdCBicmFuY2ggLUQgJGIgPiAvZGV2L251
bGwKKwkJCQlnaXQgYnJhbmNoICRiICR0YXJnZXRfYnJhbmNoX2hlYWQgPiAvZGV2L251bGwKKwkJ
CWZpCiAJCWZpCiAJZG9uZQogCi0tIAoxLjcuNS40Cgo=

--------------030801050006020606070601--
