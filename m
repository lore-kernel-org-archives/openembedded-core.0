Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB196FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 02:39:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s812dQah020796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Aug 2014 19:39:26 -0700 (PDT)
Received: from server.local (128.224.20.92) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 31 Aug 2014 19:39:25 -0700
Message-ID: <5403DC5C.4020307@windriver.com>
Date: Sun, 31 Aug 2014 22:39:24 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<1409479646.29296.223.camel@ted>
In-Reply-To: <1409479646.29296.223.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 01 Sep 2014 02:39:28 -0000
X-Groupsio-MsgNum: 57259
Content-Type: multipart/mixed; boundary="------------030906090406010805010901"

--------------030906090406010805010901
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-31, 6:07 AM, Richard Purdie wrote:
> Thanks for the other fix, I've pulled that in and am retesting. I did
> also see:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/24/steps/BuildImages/logs/stdio
>
> ERROR: Fetcher failure: Unable to find revision 5a47bbc4c3c2472f3746a8cf1485db7134cf9245 in branch master even from upstream
> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-tiny/3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0/temp/log.do_fetch.10000
> NOTE: recipe linux-yocto-tiny-3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0: task do_fetch: Failed
> ERROR: Task 324 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb, do_fetch) failed with exit code '1'
> WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta, attempting MIRRORS if available
> ERROR: Fetcher failure: Unable to find revision 12f9e966eb249c3bdcc935612e2a372e90bad950 in branch master even from upstream
> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-rt/3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0/temp/log.do_fetch.9978
> NOTE: recipe linux-yocto-rt-3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0: task do_fetch: Failed
> ERROR: Task 325 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb, do_fetch) failed with exit code '1
>
> (I've a fix in for the other alsa failure)
>
> Any idea what's up with this?

Fixed. I just pushed the patch to my contrib zedd/kernel branch. Attached
here as well.

I did fat finger the conditional assignments and include order in my
KBRANCH_DEFAULT removal patch.

But it is working now, and I'm back to normally scheduled long weekend
activities .. but will of course continue to monitor.

Bruce



>
> Cheers,
>
> Richard
>


--------------030906090406010805010901
Content-Type: application/mbox;
	name="0001-linux-yocto-ensure-that-recipe-specific-defaults-tak.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename*0="0001-linux-yocto-ensure-that-recipe-specific-defaults-tak.pa";
	filename*1="tch"

RnJvbSBlMDljMDc1OTAwZDAyM2M4NmNiOTdkOWJlOTZhM2YzMGExNzg0MjhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogU3VuLCAzMSBBdWcgMjAxNCAyMjozMzo0NCAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpbnV4LXlvY3RvOiBlbnN1cmUgdGhhdCByZWNpcGUgc3BlY2lmaWMgZGVmYXVsdHMg
dGFrZQogcHJlY2VkZW5jZQoKSW4gb3JkZXIgdG8gbWFrZSBLQlJBTkNIIGFzc2lnbm1lbnRzIG1v
cmUgZmxleGlibGUgYW5kIGVhc3kgdG8gb3ZlcnJpZGUgdGhlCmRlZmF1bHQgaW4gZWFjaCByZWNp
cGUgYXMgY2hhbmdlZCB0byBhIGNvbmRpdGlvbmFsIGFzc2lnbm1lbnQuIEJ1dCB0aGUKY29tbW9u
IGluY2x1ZGUgZmlsZSwgc2V0cyBpdHMgb3duIGJyYW5jaCBkZWZhdWx0IHRvIG1hc3Rlci4KClRo
aXMgcmVzdWx0cyBpbiB0aGUgcmVjaXBlcyBub3Qgb3ZlcnJpZGluZyBLQlJBTkNIIGFuZCBtYXN0
ZXIgYWx3YXlzIGJlaW5nCnVzZWQuCgpCeSBwdXR0aW5nIHRoZSBpbmNsdWRlIGFmdGVyIHRoZSBk
ZWZhdWx0IGFzc2lnbm1lbnQsIHdlIG5vdyBnZXQgdGhlIHByb3BlcgpkZWZhdWx0IGJyYW5jaC4K
ClNpZ25lZC1vZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIu
Y29tPgotLS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tcnRfMy4xMC5i
YiAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMu
MTQuYmIgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by10
aW55XzMuMTAuYmIgfCAzICsrLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0
by10aW55XzMuMTQuYmIgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgt
eW9jdG9fMy4xMC5iYiAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvXzMuMTQuYmIgICAgICB8IDQgKystLQogNiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMuMTAuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xp
bnV4L2xpbnV4LXlvY3RvLXJ0XzMuMTAuYmIKaW5kZXggODBkOGRiMDgyMzM4Li5kZTQwNWE1NGUz
MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tcnRf
My4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMu
MTAuYmIKQEAgLTEsOCArMSw4IEBACi1yZXF1aXJlIHJlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4
LXlvY3RvLmluYwotCiBLQlJBTkNIID89ICJzdGFuZGFyZC9wcmVlbXB0LXJ0L2Jhc2UiCiBLQlJB
TkNIX3FlbXVwcGMgPz0gInN0YW5kYXJkL3ByZWVtcHQtcnQvcWVtdXBwYyIKIAorcmVxdWlyZSBy
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by5pbmMKKwogU1JDUkVWX21hY2hpbmUgPz0g
ImMzNzNiMzQyYWY3YmNiZWRhMzQ2ZGY5NTk4YTViMWU5Nzg0ZDM2MmYiCiBTUkNSRVZfbWFjaGlu
ZV9xZW11cHBjID89ICI3NjdkYTVhMzA3ODJjYzFiYzY1MjJjZWY4YWE1ZmQ4MTMwZWNjMDZjIgog
U1JDUkVWX21ldGEgPz0gIjE5OTk0MzE0MmY3ZTBhMjgzMjQwMjQ2ZWU2YzAyZjQzNzZiMzE1ZjAi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMu
MTQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMuMTQuYmIK
aW5kZXggNDA2MDA0Zjc2MGVjLi4zYjgwYzUzMjZhNDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tcnRfMy4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMuMTQuYmIKQEAgLTEsOCArMSw4IEBACi1yZXF1
aXJlIHJlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLmluYwotCiBLQlJBTkNIID89ICJz
dGFuZGFyZC9wcmVlbXB0LXJ0L2Jhc2UiCiBLQlJBTkNIX3FlbXVwcGMgPz0gInN0YW5kYXJkL3By
ZWVtcHQtcnQvcWVtdXBwYyIKIAorcmVxdWlyZSByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15
b2N0by5pbmMKKwogU1JDUkVWX21hY2hpbmUgPz0gIjEyZjllOTY2ZWIyNDljM2JkY2M5MzU2MTJl
MmEzNzJlOTBiYWQ5NTAiCiBTUkNSRVZfbWFjaGluZV9xZW11cHBjID89ICI1MmNlYjI4OTI2NzY4
YzQ5ZjA2ZGI0ZTdlMDhkMjIyNmMyYTQ3M2ZkIgogU1JDUkVWX21ldGEgPz0gImNjYWQ5NjFjNGNi
NmJlMjQ1ZWQxOThiZDJjMTdjMjdhYjMzY2ZjZDciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfMy4xMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbGludXgvbGludXgteW9jdG8tdGlueV8zLjEwLmJiCmluZGV4IGE3NTFkNTQxMTc5YS4uNzY0
NDhlMWJhMDQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlv
Y3RvLXRpbnlfMy4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlv
Y3RvLXRpbnlfMy4xMC5iYgpAQCAtMSw2ICsxLDcgQEAKK0tCUkFOQ0ggPz0gInN0YW5kYXJkL3Rp
bnkvYmFzZSIKKwogcmVxdWlyZSByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by5pbmMK
IAotS0JSQU5DSCA/PSAic3RhbmRhcmQvdGlueS9iYXNlIgogTElOVVhfS0VSTkVMX1RZUEUgPSAi
dGlueSIKIEtDT05GSUdfTU9ERSA9ICItLWFsbG5vY29uZmlnIgogCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfMy4xNC5iYiBiL21ldGEvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV8zLjE0LmJiCmluZGV4IDJhYjNlMWMw
NjdmMy4uNTU4MGU0NDVkMjIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4
L2xpbnV4LXlvY3RvLXRpbnlfMy4xNC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4
L2xpbnV4LXlvY3RvLXRpbnlfMy4xNC5iYgpAQCAtMSw5ICsxLDkgQEAKLXJlcXVpcmUgcmVjaXBl
cy1rZXJuZWwvbGludXgvbGludXgteW9jdG8uaW5jCi0KIEtCUkFOQ0ggPz0gInN0YW5kYXJkL3Rp
bnkvYmFzZSIKIExJTlVYX0tFUk5FTF9UWVBFID0gInRpbnkiCiBLQ09ORklHX01PREUgPSAiLS1h
bGxub2NvbmZpZyIKIAorcmVxdWlyZSByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by5p
bmMKKwogTElOVVhfVkVSU0lPTiA/PSAiMy4xNC4xNyIKIAogS01FVEEgPSAibWV0YSIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fMy4xMC5iYiBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fMy4xMC5iYgppbmRleCBmMjkwNGI2
MmExMzIuLjEyNWZmZTdlMzhiYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51
eC9saW51eC15b2N0b18zLjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGlu
dXgteW9jdG9fMy4xMC5iYgpAQCAtMSw2ICsxLDYgQEAKLXJlcXVpcmUgcmVjaXBlcy1rZXJuZWwv
bGludXgvbGludXgteW9jdG8uaW5jCitLQlJBTkNIID89ICJzdGFuZGFyZC9iYXNlIgogCi1LQlJB
TkNIID0gInN0YW5kYXJkL2Jhc2UiCityZXF1aXJlIHJlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4
LXlvY3RvLmluYwogCiAjIGJvYXJkIHNwZWNpZmljIGJyYW5jaGVzCiBLQlJBTkNIX3FlbXVhcm0g
ID89ICJzdGFuZGFyZC9hcm0tdmVyc2F0aWxlLTkyNmVqcyIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fMy4xNC5iYiBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbGludXgvbGludXgteW9jdG9fMy4xNC5iYgppbmRleCAyMDI0ZDhlNDk1MzYuLmU4OGUzMWEy
YmFkZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b18z
LjE0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fMy4xNC5i
YgpAQCAtMSw3ICsxLDcgQEAKLXJlcXVpcmUgcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9j
dG8uaW5jCi0KIEtCUkFOQ0ggPz0gInN0YW5kYXJkL2Jhc2UiCiAKK3JlcXVpcmUgcmVjaXBlcy1r
ZXJuZWwvbGludXgvbGludXgteW9jdG8uaW5jCisKICMgYm9hcmQgc3BlY2lmaWMgYnJhbmNoZXMK
IEtCUkFOQ0hfcWVtdWFybSAgPz0gInN0YW5kYXJkL2FybS12ZXJzYXRpbGUtOTI2ZWpzIgogS0JS
QU5DSF9xZW11bWlwcyA/PSAic3RhbmRhcmQvbXRpLW1hbHRhMzIiCi0tIAoxLjguMS4yCgo=

--------------030906090406010805010901--
