Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149C3C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 02:53:47 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.22670.1685588017106149311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 19:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8AxBvEtCHhkFCoDAA--.7105S3;
	Thu, 01 Jun 2023 10:53:34 +0800 (CST)
Received: from [10.20.42.22] (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx670qCHhk13ODAA--.16171S3;
	Thu, 01 Jun 2023 10:53:30 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------ylHoAjrKkGJCE7N3J0IV54me"
Message-ID: <ba7a8598-1b49-a6ff-36ba-a11f097d3250@loongson.cn>
Date: Thu, 1 Jun 2023 10:53:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH][pseudo] Move __*xstat* and __xmknod functions
 to new subport 'old__x'
Content-Language: en-US
To: Mark Hatle <mark.hatle@kernel.crashing.org>, mark.hatle@amd.com,
 openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
References: <20230531030126.5837-1-mark.hatle@amd.com>
 <6bce2f73-ae0b-56f9-799e-e4ba947f38bb@kernel.crashing.org>
From: =?UTF-8?B?5byg5a625bKt?= <zhangjialing@loongson.cn>
In-Reply-To: <6bce2f73-ae0b-56f9-799e-e4ba947f38bb@kernel.crashing.org>
X-CM-TRANSID: AQAAf8Bx670qCHhk13ODAA--.16171S3
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQAIB2R154BmgAAHsZ
X-Coremail-Antispam: 1Uk129KBjvJXoWxtFWxZw43Zr45Zw48Xr15CFg_yoWxKr4rpF
	W8Gr1UJrW7Jr4xJr17J3WjkryrtF48Aw4UJw17KF4UJFyUAryIqr1qg34IgF1kJFW8ZF48
	Xr4kZrn8urnrJrDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbPAYFVCjjxCrM7AC8VAFwI0_Jr0_
	Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFV
	AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2
	z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
	1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkE
	cVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1lYx0E2Ix0cI8IcVAFwI0_Jr
	v_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxG
	rwACY4xI67k04243AVAKzVAKj4xxM4xvF2IEb7IF0Fy26I8I3I1l7480Y4vEI4kI2Ix0rV
	Aqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UMVCEFcxC0VAYjxAxZFUvcSsGvfC2KfnxnUUI43ZEXa7IU1Pl1PUUUU
	U==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 02:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182043

This is a multi-part message in MIME format.
--------------ylHoAjrKkGJCE7N3J0IV54me
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Mark

This looks more reasonable, and I'd like to test the code.

在 2023/5/31 11:05, Mark Hatle 写道:
> This code only switched the usage of the removed __ functions based on 
> availability of _STAT_VER and _MKNOD_VER in the ports/linux/subport 
> file.  If you change the conditional to 'if true ; then' the system 
> will enable the older style code unconditionally.  I did verify that 
> appears to be working for me.
>
> If anyone has a good idea how to adjust the configure script to pass 
> the data to the subport file, that would be ideal.  Default behavior 
> of checking the system, optional behaving of an 
> --enable-compat-xfunctions -- or something like that.
>
> As for the loongarch64, this code should work there as it's now 
> written.  I do not have a way to test this, so I'm hoping JiaLing 
> Zhang will be able to build and test this.
>
> All of my testing was accomplished using the 'make test' target. More 
> extensive testing will be needed before we can trust this for OE, but 
> it's probably closer to something that does what we need.
>
> (There is still more duplication then I would like.. hopefully 
> reviewers will be able to suggest something.)
>
> --Mark
>
> On 5/30/23 10:01 PM, Mark Hatle via lists.openembedded.org wrote:
>> Changes to eliminate __*.c function usage were based on the patch:
>>
>>     From: JiaLing Zhang <zhangjialing@loongson.cn>
>>     Subject: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
>>
>>     Fixes [YOCTO #15110]
>>
>>     Some functions used in the project have been removed from glibc. 
>> After the removal of these functions,
>>     the architecture in glibc will not include the removed functions.
>>     This patch resolves the usage and compilation issues on the 
>> loongarch64 architecture
>>
>>     Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>
>>
>> This code is NOT loongarch64 specific, but implements support for newer
>> glibc where the __*x*stat and __xmknod* functions are no longer present
>> in headers as of roughly glibc 2.33.
>>
>> The functions, on x86, x86_64 and aarch64 may still be present for
>> compatibility but new software should no longer be using it. Pseudo
>> can likely change it's default behavior unless support for really old
>> hosts is still desired.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
>>   ports/linux/guts/fopen64.c                   |  4 +-
>>   ports/linux/guts/freopen64.c                 |  4 +-
>>   ports/linux/guts/fstat.c                     |  8 ++-
>>   ports/linux/guts/fstat64.c                   | 14 +++-
>>   ports/linux/guts/fstatat.c                   |  9 ++-
>>   ports/linux/guts/fstatat64.c                 | 42 +++++++++++-
>>   ports/linux/guts/lstat.c                     |  2 +-
>>   ports/linux/guts/lstat64.c                   |  2 +-
>>   ports/linux/guts/mknod.c                     |  2 +-
>>   ports/linux/guts/mknodat.c                   | 71 +++++++++++++++++++-
>>   ports/linux/guts/mkostemp64.c                |  2 +-
>>   ports/linux/guts/openat.c                    | 18 ++---
>>   ports/linux/guts/stat.c                      |  2 +-
>>   ports/linux/guts/stat64.c                    |  2 +-
>>   ports/linux/old__x/README                    | 28 ++++++++
>>   ports/linux/{ => old__x}/guts/__fxstat.c     |  0
>>   ports/linux/{ => old__x}/guts/__fxstat64.c   |  0
>>   ports/linux/{ => old__x}/guts/__fxstatat.c   |  0
>>   ports/linux/{ => old__x}/guts/__fxstatat64.c |  0
>>   ports/linux/{ => old__x}/guts/__lxstat.c     |  0
>>   ports/linux/{ => old__x}/guts/__lxstat64.c   |  0
>>   ports/linux/{ => old__x}/guts/__xmknod.c     |  0
>>   ports/linux/{ => old__x}/guts/__xmknodat.c   |  0
>>   ports/linux/{ => old__x}/guts/__xstat.c      |  0
>>   ports/linux/{ => old__x}/guts/__xstat64.c    |  0
>>   ports/linux/old__x/guts/fstat.c              | 15 +++++
>>   ports/linux/old__x/guts/fstat64.c            | 15 +++++
>>   ports/linux/old__x/guts/fstatat.c            | 15 +++++
>>   ports/linux/old__x/guts/fstatat64.c          | 15 +++++
>>   ports/linux/old__x/guts/lstat.c              | 15 +++++
>>   ports/linux/old__x/guts/lstat64.c            | 15 +++++
>>   ports/linux/old__x/guts/mknod.c              | 15 +++++
>>   ports/linux/old__x/guts/mknodat.c            | 15 +++++
>>   ports/linux/old__x/guts/mkostemp64.c         | 53 +++++++++++++++
>>   ports/linux/old__x/portdefs.h                | 40 +++++++++++
>>   ports/linux/old__x/pseudo_wrappers.c         | 48 +++++++++++++
>>   ports/linux/old__x/wrapfuncs.in              | 18 +++++
>>   ports/linux/portdefs.h                       | 19 ------
>>   ports/linux/pseudo_wrappers.c                | 43 ------------
>>   ports/linux/subports                         | 15 +++++
>>   ports/linux/wrapfuncs.in                     | 26 +++----
>>   pseudo_client.h                              | 38 +++++++++--
>>   42 files changed, 520 insertions(+), 110 deletions(-)
>>   create mode 100644 ports/linux/old__x/README
>>   rename ports/linux/{ => old__x}/guts/__fxstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstatat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__fxstatat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__lxstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__lxstat64.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xmknod.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xmknodat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xstat.c (100%)
>>   rename ports/linux/{ => old__x}/guts/__xstat64.c (100%)
>>   create mode 100644 ports/linux/old__x/guts/fstat.c
>>   create mode 100644 ports/linux/old__x/guts/fstat64.c
>>   create mode 100644 ports/linux/old__x/guts/fstatat.c
>>   create mode 100644 ports/linux/old__x/guts/fstatat64.c
>>   create mode 100644 ports/linux/old__x/guts/lstat.c
>>   create mode 100644 ports/linux/old__x/guts/lstat64.c
>>   create mode 100644 ports/linux/old__x/guts/mknod.c
>>   create mode 100644 ports/linux/old__x/guts/mknodat.c
>>   create mode 100644 ports/linux/old__x/guts/mkostemp64.c
>>   create mode 100644 ports/linux/old__x/portdefs.h
>>   create mode 100644 ports/linux/old__x/pseudo_wrappers.c
>>   create mode 100644 ports/linux/old__x/wrapfuncs.in
--------------ylHoAjrKkGJCE7N3J0IV54me
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PVVURi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9k
eT4NCiAgICA8cD5IaSwgTWFyazwvcD4NCiAgICA8cCBzdHlsZT0iYm9yZGVyOiAwcHggc29s
aWQgcmdiKDIxNywgMjE3LCAyMjcpOyBib3gtc2l6aW5nOiBib3JkZXItYm94OyAtLXR3LWJv
cmRlci1zcGFjaW5nLXg6MDsgLS10dy1ib3JkZXItc3BhY2luZy15OjA7IC0tdHctdHJhbnNs
YXRlLXg6MDsgLS10dy10cmFuc2xhdGUteTowOyAtLXR3LXJvdGF0ZTowOyAtLXR3LXNrZXct
eDowOyAtLXR3LXNrZXcteTowOyAtLXR3LXNjYWxlLXg6MTsgLS10dy1zY2FsZS15OjE7IC0t
dHctcGFuLXg6IDsgLS10dy1wYW4teTogOyAtLXR3LXBpbmNoLXpvb206IDsgLS10dy1zY3Jv
bGwtc25hcC1zdHJpY3RuZXNzOnByb3hpbWl0eTsgLS10dy1ncmFkaWVudC1mcm9tLXBvc2l0
aW9uOiA7IC0tdHctZ3JhZGllbnQtdmlhLXBvc2l0aW9uOiA7IC0tdHctZ3JhZGllbnQtdG8t
cG9zaXRpb246IDsgLS10dy1vcmRpbmFsOiA7IC0tdHctc2xhc2hlZC16ZXJvOiA7IC0tdHct
bnVtZXJpYy1maWd1cmU6IDsgLS10dy1udW1lcmljLXNwYWNpbmc6IDsgLS10dy1udW1lcmlj
LWZyYWN0aW9uOiA7IC0tdHctcmluZy1pbnNldDogOyAtLXR3LXJpbmctb2Zmc2V0LXdpZHRo
OjBweDsgLS10dy1yaW5nLW9mZnNldC1jb2xvcjojZmZmOyAtLXR3LXJpbmctY29sb3I6cmdi
YSg2OSw4OSwxNjQsMC41KTsgLS10dy1yaW5nLW9mZnNldC1zaGFkb3c6MCAwIHRyYW5zcGFy
ZW50OyAtLXR3LXJpbmctc2hhZG93OjAgMCB0cmFuc3BhcmVudDsgLS10dy1zaGFkb3c6MCAw
IHRyYW5zcGFyZW50OyAtLXR3LXNoYWRvdy1jb2xvcmVkOjAgMCB0cmFuc3BhcmVudDsgLS10
dy1ibHVyOiA7IC0tdHctYnJpZ2h0bmVzczogOyAtLXR3LWNvbnRyYXN0OiA7IC0tdHctZ3Jh
eXNjYWxlOiA7IC0tdHctaHVlLXJvdGF0ZTogOyAtLXR3LWludmVydDogOyAtLXR3LXNhdHVy
YXRlOiA7IC0tdHctc2VwaWE6IDsgLS10dy1kcm9wLXNoYWRvdzogOyAtLXR3LWJhY2tkcm9w
LWJsdXI6IDsgLS10dy1iYWNrZHJvcC1icmlnaHRuZXNzOiA7IC0tdHctYmFja2Ryb3AtY29u
dHJhc3Q6IDsgLS10dy1iYWNrZHJvcC1ncmF5c2NhbGU6IDsgLS10dy1iYWNrZHJvcC1odWUt
cm90YXRlOiA7IC0tdHctYmFja2Ryb3AtaW52ZXJ0OiA7IC0tdHctYmFja2Ryb3Atb3BhY2l0
eTogOyAtLXR3LWJhY2tkcm9wLXNhdHVyYXRlOiA7IC0tdHctYmFja2Ryb3Atc2VwaWE6IDsg
bWFyZ2luOiAwcHggMHB4IDEuMjVlbTsgY29sb3I6IHJnYig1NSwgNjUsIDgxKTsgZm9udC1m
YW1pbHk6IFPDtmhuZSwgdWktc2Fucy1zZXJpZiwgc3lzdGVtLXVpLCAtYXBwbGUtc3lzdGVt
LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgUm9ib3RvLCBVYnVudHUsIENhbnRhcmVsbCwgJnF1
b3Q7Tm90byBTYW5zJnF1b3Q7LCBzYW5zLXNlcmlmLCAmcXVvdDtIZWx2ZXRpY2EgTmV1ZSZx
dW90OywgQXJpYWwsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdv
ZSBVSSBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7LCAmcXVvdDtO
b3RvIENvbG9yIEVtb2ppJnF1b3Q7OyBmb250LXNpemU6IDE2cHg7IGZvbnQtc3R5bGU6IG5v
cm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczogbm9ybWFsOyBmb250LXZhcmlhbnQtY2Fw
czogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0ZXItc3BhY2luZzogbm9ybWFsOyBv
cnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1pbmRlbnQ6IDBweDsgdGV4dC10
cmFuc2Zvcm06IG5vbmU7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd2lkb3dzOiAyOyB3b3Jk
LXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyBiYWNrZ3Jv
dW5kLWNvbG9yOiByZ2IoMjQ3LCAyNDcsIDI0OCk7IHRleHQtZGVjb3JhdGlvbi10aGlja25l
c3M6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1zdHlsZTogaW5pdGlhbDsgdGV4dC1kZWNv
cmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+VGhpcyBsb29rcyBtb3JlIHJlYXNvbmFibGUsIGFu
ZCBJJ2QgbGlrZSAgdG8gdGVzdCB0aGUgY29kZS48L3A+DQogICAgPHA+PC9wPg0KICAgIDxk
aXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+5ZyoIDIwMjMvNS8zMSAxMTowNSwgTWFyayBI
YXRsZSDlhpnpgZM6PGJyPg0KICAgIDwvZGl2Pg0KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiDQogICAgICBjaXRlPSJtaWQ6NmJjZTJmNzMtYWUwYi01NmY5LTc5OWUtZTRiYTk0N2Yz
OGJiQGtlcm5lbC5jcmFzaGluZy5vcmciPlRoaXMNCiAgICAgIGNvZGUgb25seSBzd2l0Y2hl
ZCB0aGUgdXNhZ2Ugb2YgdGhlIHJlbW92ZWQgX18gZnVuY3Rpb25zIGJhc2VkIG9uDQogICAg
ICBhdmFpbGFiaWxpdHkgb2YgX1NUQVRfVkVSIGFuZCBfTUtOT0RfVkVSIGluIHRoZQ0KICAg
ICAgcG9ydHMvbGludXgvc3VicG9ydCBmaWxlLsKgIElmIHlvdSBjaGFuZ2UgdGhlIGNvbmRp
dGlvbmFsIHRvICdpZg0KICAgICAgdHJ1ZSA7IHRoZW4nIHRoZSBzeXN0ZW0gd2lsbCBlbmFi
bGUgdGhlIG9sZGVyIHN0eWxlIGNvZGUNCiAgICAgIHVuY29uZGl0aW9uYWxseS7CoCBJIGRp
ZCB2ZXJpZnkgdGhhdCBhcHBlYXJzIHRvIGJlIHdvcmtpbmcgZm9yIG1lLg0KICAgICAgPGJy
Pg0KICAgICAgPGJyPg0KICAgICAgSWYgYW55b25lIGhhcyBhIGdvb2QgaWRlYSBob3cgdG8g
YWRqdXN0IHRoZSBjb25maWd1cmUgc2NyaXB0IHRvDQogICAgICBwYXNzIHRoZSBkYXRhIHRv
IHRoZSBzdWJwb3J0IGZpbGUsIHRoYXQgd291bGQgYmUgaWRlYWwuwqAgRGVmYXVsdA0KICAg
ICAgYmVoYXZpb3Igb2YgY2hlY2tpbmcgdGhlIHN5c3RlbSwgb3B0aW9uYWwgYmVoYXZpbmcg
b2YgYW4NCiAgICAgIC0tZW5hYmxlLWNvbXBhdC14ZnVuY3Rpb25zIC0tIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQogICAgICA8YnI+DQogICAgICA8YnI+DQogICAgICBBcyBmb3IgdGhl
IGxvb25nYXJjaDY0LCB0aGlzIGNvZGUgc2hvdWxkIHdvcmsgdGhlcmUgYXMgaXQncyBub3cN
CiAgICAgIHdyaXR0ZW4uwqAgSSBkbyBub3QgaGF2ZSBhIHdheSB0byB0ZXN0IHRoaXMsIHNv
IEknbSBob3BpbmcgSmlhTGluZw0KICAgICAgWmhhbmcgd2lsbCBiZSBhYmxlIHRvIGJ1aWxk
IGFuZCB0ZXN0IHRoaXMuDQogICAgICA8YnI+DQogICAgICA8YnI+DQogICAgICBBbGwgb2Yg
bXkgdGVzdGluZyB3YXMgYWNjb21wbGlzaGVkIHVzaW5nIHRoZSAnbWFrZSB0ZXN0JyB0YXJn
ZXQuwqANCiAgICAgIE1vcmUgZXh0ZW5zaXZlIHRlc3Rpbmcgd2lsbCBiZSBuZWVkZWQgYmVm
b3JlIHdlIGNhbiB0cnVzdCB0aGlzIGZvcg0KICAgICAgT0UsIGJ1dCBpdCdzIHByb2JhYmx5
IGNsb3NlciB0byBzb21ldGhpbmcgdGhhdCBkb2VzIHdoYXQgd2UgbmVlZC4NCiAgICAgIDxi
cj4NCiAgICAgIDxicj4NCiAgICAgIChUaGVyZSBpcyBzdGlsbCBtb3JlIGR1cGxpY2F0aW9u
IHRoZW4gSSB3b3VsZCBsaWtlLi4gaG9wZWZ1bGx5DQogICAgICByZXZpZXdlcnMgd2lsbCBi
ZSBhYmxlIHRvIHN1Z2dlc3Qgc29tZXRoaW5nLikNCiAgICAgIDxicj4NCiAgICAgIDxicj4N
CiAgICAgIC0tTWFyaw0KICAgICAgPGJyPg0KICAgICAgPGJyPg0KICAgICAgT24gNS8zMC8y
MyAxMDowMSBQTSwgTWFyayBIYXRsZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90
ZToNCiAgICAgIDxicj4NCiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPkNoYW5nZXMg
dG8gZWxpbWluYXRlIF9fKi5jIGZ1bmN0aW9uIHVzYWdlDQogICAgICAgIHdlcmUgYmFzZWQg
b24gdGhlIHBhdGNoOg0KICAgICAgICA8YnI+DQogICAgICAgIDxicj4NCiAgICAgICAgwqDC
oMKgIEZyb206IEppYUxpbmcgWmhhbmcgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnpoYW5namlhbGluZ0Bsb29uZ3Nvbi5jbiI+Jmx0O3poYW5namlh
bGluZ0Bsb29uZ3Nvbi5jbiZndDs8L2E+DQogICAgICAgIDxicj4NCiAgICAgICAgwqDCoMKg
IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0ggdjRdIEZpeGVzIHBzZXVkbyBidWlsZCBpbg0K
ICAgICAgICBsb29uZ2FyY2g2NA0KICAgICAgICA8YnI+DQogICAgICAgIDxicj4NCiAgICAg
ICAgwqDCoMKgIEZpeGVzIFtZT0NUTyAjMTUxMTBdDQogICAgICAgIDxicj4NCiAgICAgICAg
PGJyPg0KICAgICAgICDCoMKgwqAgU29tZSBmdW5jdGlvbnMgdXNlZCBpbiB0aGUgcHJvamVj
dCBoYXZlIGJlZW4gcmVtb3ZlZCBmcm9tDQogICAgICAgIGdsaWJjLiBBZnRlciB0aGUgcmVt
b3ZhbCBvZiB0aGVzZSBmdW5jdGlvbnMsDQogICAgICAgIDxicj4NCiAgICAgICAgwqDCoMKg
IHRoZSBhcmNoaXRlY3R1cmUgaW4gZ2xpYmMgd2lsbCBub3QgaW5jbHVkZSB0aGUgcmVtb3Zl
ZA0KICAgICAgICBmdW5jdGlvbnMuDQogICAgICAgIDxicj4NCiAgICAgICAgwqDCoMKgIFRo
aXMgcGF0Y2ggcmVzb2x2ZXMgdGhlIHVzYWdlIGFuZCBjb21waWxhdGlvbiBpc3N1ZXMgb24g
dGhlDQogICAgICAgIGxvb25nYXJjaDY0IGFyY2hpdGVjdHVyZQ0KICAgICAgICA8YnI+DQog
ICAgICAgIDxicj4NCiAgICAgICAgwqDCoMKgIFNpZ25lZC1vZmYtYnk6IEppYUxpbmcgWmhh
bmcNCiAgICAgICAgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOnpoYW5namlhbGluZ0Bsb29uZ3Nvbi5jbiI+Jmx0O3poYW5namlhbGluZ0Bsb29uZ3Nv
bi5jbiZndDs8L2E+DQogICAgICAgIDxicj4NCiAgICAgICAgPGJyPg0KICAgICAgICBUaGlz
IGNvZGUgaXMgTk9UIGxvb25nYXJjaDY0IHNwZWNpZmljLCBidXQgaW1wbGVtZW50cyBzdXBw
b3J0DQogICAgICAgIGZvciBuZXdlcg0KICAgICAgICA8YnI+DQogICAgICAgIGdsaWJjIHdo
ZXJlIHRoZSBfXyp4KnN0YXQgYW5kIF9feG1rbm9kKiBmdW5jdGlvbnMgYXJlIG5vIGxvbmdl
cg0KICAgICAgICBwcmVzZW50DQogICAgICAgIDxicj4NCiAgICAgICAgaW4gaGVhZGVycyBh
cyBvZiByb3VnaGx5IGdsaWJjIDIuMzMuDQogICAgICAgIDxicj4NCiAgICAgICAgPGJyPg0K
ICAgICAgICBUaGUgZnVuY3Rpb25zLCBvbiB4ODYsIHg4Nl82NCBhbmQgYWFyY2g2NCBtYXkg
c3RpbGwgYmUgcHJlc2VudA0KICAgICAgICBmb3INCiAgICAgICAgPGJyPg0KICAgICAgICBj
b21wYXRpYmlsaXR5IGJ1dCBuZXcgc29mdHdhcmUgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2lu
ZyBpdC7CoA0KICAgICAgICBQc2V1ZG8NCiAgICAgICAgPGJyPg0KICAgICAgICBjYW4gbGlr
ZWx5IGNoYW5nZSBpdCdzIGRlZmF1bHQgYmVoYXZpb3IgdW5sZXNzIHN1cHBvcnQgZm9yDQog
ICAgICAgIHJlYWxseSBvbGQNCiAgICAgICAgPGJyPg0KICAgICAgICBob3N0cyBpcyBzdGls
bCBkZXNpcmVkLg0KICAgICAgICA8YnI+DQogICAgICAgIDxicj4NCiAgICAgICAgU2lnbmVk
LW9mZi1ieTogTWFyayBIYXRsZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86bWFyay5oYXRsZUBhbWQuY29tIj4mbHQ7bWFyay5oYXRsZUBhbWQuY29t
Jmd0OzwvYT4NCiAgICAgICAgPGJyPg0KICAgICAgICAtLS0NCiAgICAgICAgPGJyPg0KICAg
ICAgICDCoCBwb3J0cy9saW51eC9ndXRzL2ZvcGVuNjQuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBv
cnRzL2xpbnV4L2d1dHMvZnJlb3BlbjY0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgNCArLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L2d1
dHMvZnN0YXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDggKystDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvZ3V0cy9mc3Rh
dDY0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKystDQog
ICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvZ3V0cy9mc3RhdGF0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKystDQogICAgICAgIDxi
cj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvZ3V0cy9mc3RhdGF0NjQuY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDIgKysrKysrKysrKystDQogICAgICAgIDxicj4N
CiAgICAgICAgwqAgcG9ydHMvbGludXgvZ3V0cy9sc3RhdC5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KICAgICAgICA8YnI+DQogICAgICAg
IMKgIHBvcnRzL2xpbnV4L2d1dHMvbHN0YXQ2NC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMv
bGludXgvZ3V0cy9ta25vZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L2d1
dHMvbWtub2RhdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNzEN
CiAgICAgICAgKysrKysrKysrKysrKysrKysrKy0NCiAgICAgICAgPGJyPg0KICAgICAgICDC
oCBwb3J0cy9saW51eC9ndXRzL21rb3N0ZW1wNjQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMiArLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4
L2d1dHMvb3BlbmF0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDE4ICsrLS0tDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvZ3V0cy9z
dGF0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0NCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC9ndXRzL3N0YXQ2NC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0NCiAgICAg
ICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC9vbGRfX3gvUkVBRE1FwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKw0KICAgICAgICA8
YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L3sgPSZndDsgb2xkX194fS9ndXRzL19fZnhz
dGF0LmPCoMKgwqDCoCB8wqAgMA0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xp
bnV4L3sgPSZndDsgb2xkX194fS9ndXRzL19fZnhzdGF0NjQuY8KgwqAgfMKgIDANCiAgICAg
ICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9f
X2Z4c3RhdGF0LmPCoMKgIHzCoCAwDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMv
bGludXgveyA9Jmd0OyBvbGRfX3h9L2d1dHMvX19meHN0YXRhdDY0LmMgfMKgIDANCiAgICAg
ICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9f
X2x4c3RhdC5jwqDCoMKgwqAgfMKgIDANCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBwb3J0
cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9fX2x4c3RhdDY0LmPCoMKgIHzCoCAwDQog
ICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgveyA9Jmd0OyBvbGRfX3h9L2d1
dHMvX194bWtub2QuY8KgwqDCoMKgIHzCoCAwDQogICAgICAgIDxicj4NCiAgICAgICAgwqAg
cG9ydHMvbGludXgveyA9Jmd0OyBvbGRfX3h9L2d1dHMvX194bWtub2RhdC5jwqDCoCB8wqAg
MA0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L3sgPSZndDsgb2xkX194
fS9ndXRzL19feHN0YXQuY8KgwqDCoMKgwqAgfMKgIDANCiAgICAgICAgPGJyPg0KICAgICAg
ICDCoCBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9fX3hzdGF0NjQuY8KgwqDC
oCB8wqAgMA0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L29sZF9feC9n
dXRzL2ZzdGF0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrDQogICAg
ICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvb2xkX194L2d1dHMvZnN0YXQ2NC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrDQogICAgICAgIDxicj4NCiAgICAg
ICAgwqAgcG9ydHMvbGludXgvb2xkX194L2d1dHMvZnN0YXRhdC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE1ICsrKysrDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGlu
dXgvb2xkX194L2d1dHMvZnN0YXRhdDY0LmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNSArKysr
Kw0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L29sZF9feC9ndXRzL2xz
dGF0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrDQogICAgICAgIDxi
cj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvb2xkX194L2d1dHMvbHN0YXQ2NC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrDQogICAgICAgIDxicj4NCiAgICAgICAgwqAg
cG9ydHMvbGludXgvb2xkX194L2d1dHMvbWtub2QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTUgKysrKysNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC9v
bGRfX3gvZ3V0cy9ta25vZGF0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTUgKysrKysN
CiAgICAgICAgPGJyPg0KICAgICAgICDCoCBwb3J0cy9saW51eC9vbGRfX3gvZ3V0cy9ta29z
dGVtcDY0LmPCoMKgwqDCoMKgwqDCoMKgIHwgNTMNCiAgICAgICAgKysrKysrKysrKysrKysr
DQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvb2xkX194L3BvcnRkZWZz
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MCArKysrKysrKysrKw0KICAg
ICAgICA8YnI+DQogICAgICAgIMKgIHBvcnRzL2xpbnV4L29sZF9feC9wc2V1ZG9fd3JhcHBl
cnMuY8KgwqDCoMKgwqDCoMKgwqAgfCA0OA0KICAgICAgICArKysrKysrKysrKysrDQogICAg
ICAgIDxicj4NCiAgICAgICAgwqAgcG9ydHMvbGludXgvb2xkX194L3dyYXBmdW5jcy5pbsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTggKysrKysNCiAgICAgICAgPGJyPg0KICAg
ICAgICDCoCBwb3J0cy9saW51eC9wb3J0ZGVmcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOSAtLS0tLS0NCiAgICAgICAgPGJyPg0KICAgICAg
ICDCoCBwb3J0cy9saW51eC9wc2V1ZG9fd3JhcHBlcnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDQzIC0tLS0tLS0tLS0tLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKg
IHBvcnRzL2xpbnV4L3N1YnBvcnRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMTUgKysrKysNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBw
b3J0cy9saW51eC93cmFwZnVuY3MuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMjYgKysrLS0tLQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHBzZXVk
b19jbGllbnQuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAzOCArKysrKysrKystLQ0KICAgICAgICA8YnI+DQogICAgICAg
IMKgIDQyIGZpbGVzIGNoYW5nZWQsIDUyMCBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25z
KC0pDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBvcnRz
L2xpbnV4L29sZF9feC9SRUFETUUNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCByZW5hbWUg
cG9ydHMvbGludXgveyA9Jmd0OyBvbGRfX3h9L2d1dHMvX19meHN0YXQuYyAoMTAwJSkNCiAg
ICAgICAgPGJyPg0KICAgICAgICDCoCByZW5hbWUgcG9ydHMvbGludXgveyA9Jmd0OyBvbGRf
X3h9L2d1dHMvX19meHN0YXQ2NC5jICgxMDAlKQ0KICAgICAgICA8YnI+DQogICAgICAgIMKg
IHJlbmFtZSBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9fX2Z4c3RhdGF0LmMg
KDEwMCUpDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcmVuYW1lIHBvcnRzL2xpbnV4L3sg
PSZndDsgb2xkX194fS9ndXRzL19fZnhzdGF0YXQ2NC5jICgxMDAlKQ0KICAgICAgICA8YnI+
DQogICAgICAgIMKgIHJlbmFtZSBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9f
X2x4c3RhdC5jICgxMDAlKQ0KICAgICAgICA8YnI+DQogICAgICAgIMKgIHJlbmFtZSBwb3J0
cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9fX2x4c3RhdDY0LmMgKDEwMCUpDQogICAg
ICAgIDxicj4NCiAgICAgICAgwqAgcmVuYW1lIHBvcnRzL2xpbnV4L3sgPSZndDsgb2xkX194
fS9ndXRzL19feG1rbm9kLmMgKDEwMCUpDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgcmVu
YW1lIHBvcnRzL2xpbnV4L3sgPSZndDsgb2xkX194fS9ndXRzL19feG1rbm9kYXQuYyAoMTAw
JSkNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCByZW5hbWUgcG9ydHMvbGludXgveyA9Jmd0
OyBvbGRfX3h9L2d1dHMvX194c3RhdC5jICgxMDAlKQ0KICAgICAgICA8YnI+DQogICAgICAg
IMKgIHJlbmFtZSBwb3J0cy9saW51eC97ID0mZ3Q7IG9sZF9feH0vZ3V0cy9fX3hzdGF0NjQu
YyAoMTAwJSkNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBjcmVhdGUgbW9kZSAxMDA2NDQg
cG9ydHMvbGludXgvb2xkX194L2d1dHMvZnN0YXQuYw0KICAgICAgICA8YnI+DQogICAgICAg
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwb3J0cy9saW51eC9vbGRfX3gvZ3V0cy9mc3RhdDY0
LmMNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcG9ydHMv
bGludXgvb2xkX194L2d1dHMvZnN0YXRhdC5jDQogICAgICAgIDxicj4NCiAgICAgICAgwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBvcnRzL2xpbnV4L29sZF9feC9ndXRzL2ZzdGF0YXQ2NC5j
DQogICAgICAgIDxicj4NCiAgICAgICAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBvcnRzL2xp
bnV4L29sZF9feC9ndXRzL2xzdGF0LmMNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBjcmVh
dGUgbW9kZSAxMDA2NDQgcG9ydHMvbGludXgvb2xkX194L2d1dHMvbHN0YXQ2NC5jDQogICAg
ICAgIDxicj4NCiAgICAgICAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBvcnRzL2xpbnV4L29s
ZF9feC9ndXRzL21rbm9kLmMNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgcG9ydHMvbGludXgvb2xkX194L2d1dHMvbWtub2RhdC5jDQogICAgICAgIDxi
cj4NCiAgICAgICAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBvcnRzL2xpbnV4L29sZF9feC9n
dXRzL21rb3N0ZW1wNjQuYw0KICAgICAgICA8YnI+DQogICAgICAgIMKgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwb3J0cy9saW51eC9vbGRfX3gvcG9ydGRlZnMuaA0KICAgICAgICA8YnI+DQog
ICAgICAgIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwb3J0cy9saW51eC9vbGRfX3gvcHNldWRv
X3dyYXBwZXJzLmMNCiAgICAgICAgPGJyPg0KICAgICAgICDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgcG9ydHMvbGludXgvb2xkX194L3dyYXBmdW5jcy5pbg0KICAgICAgICA8YnI+DQogICAg
ICA8L2Jsb2NrcXVvdGU+DQogICAgPC9ibG9ja3F1b3RlPg0KICA8L2JvZHk+DQo8L2h0bWw+
DQo=

--------------ylHoAjrKkGJCE7N3J0IV54me--


