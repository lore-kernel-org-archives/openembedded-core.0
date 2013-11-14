Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 288CC6D733
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 19:35:15 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id p9so1944205lbv.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 11:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=95KCTBgqp0dys8H4mnurLMZk5nLr2/rHI5v6khnGomY=;
	b=tcIVGvgcpaYNFma8uODnVgp8HDyMY+cxYM1+vs3CZgH+snYVkxWMCUA94sS+xtmEwY
	pIRrfHAN9/QVURCat8+2QpYREyXVQ7fzbTViOE2g5aU5hGDWH3fWZddqPmJtIcDbg/YU
	aYPOgpUY/lKJobwwIFX/L+Pv8Nn1FEhNP9VEA2G+JvuGDjVvAnqOVp1XwamB5vqsGY69
	hw0u01lsHCMoQosR2RP7XljbhESH4WR/cXo7MEUC4FStXEePVkJvXfA5S2WneZ7thf26
	u7LfxwGyOZYgx6REWndO2w5uQu71bWCkjTi7md2IiUjTk2AyROB464VjlO7GrtbDe7C2
	LJFw==
MIME-Version: 1.0
X-Received: by 10.152.225.161 with SMTP id rl1mr1811537lac.38.1384457717160;
	Thu, 14 Nov 2013 11:35:17 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Thu, 14 Nov 2013 11:35:16 -0800 (PST)
In-Reply-To: <6bcd8c77705e3e969adfef1ae2f3e877a56573c1.1384447700.git.bruce.ashfield@windriver.com>
References: <cover.1384447700.git.bruce.ashfield@windriver.com>
	<6bcd8c77705e3e969adfef1ae2f3e877a56573c1.1384447700.git.bruce.ashfield@windriver.com>
Date: Thu, 14 Nov 2013 14:35:16 -0500
Message-ID: <CADkTA4P3WzCjiOuToQw8X-LxoODPk4MaizjBAuHA41L8uVGAXA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto/3.10: meta: ARM: OMAP3: Add USB PHY driver for Beagleboard
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
X-List-Received-Date: Thu, 14 Nov 2013 19:35:17 -0000
X-Groupsio-MsgNum: 47090
Content-Type: multipart/mixed; boundary=001a113490fa70347404eb282e76

--001a113490fa70347404eb282e76
Content-Type: text/plain; charset=ISO-8859-1

Argh. My tools that update the SRCREVs picked up a temporary branch from
Darren and I got the wrong SRCREVs.

Use this replacement patch .. and you'll be better off :)

Bruce

On Thu, Nov 14, 2013 at 11:55 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Updating the meta branch SRCREV to update the USB configuration:
>
>     The Beagleboard needs the USB PHY drivers in the kernel in order to enable
>     USB and Ethernet functionality. This fix ensures that they are built in
>     by tweaking the kernel config.
>
>     Tested on Beagleboard xM Rev. C2.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 +--
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> index ab95ad1..ab36e6a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> @@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>
>  SRCREV_machine ?= "97499dfaea61934719b91f1347f468c6f0125b2c"
>  SRCREV_machine_qemuppc ?= "54cb4efa033af86301934d58d890a5324cc95a75"
> -SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
> +SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> index c15c311..d503d44 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> @@ -10,8 +10,7 @@ LINUX_VERSION ?= "3.10.17"
>  KMETA = "meta"
>
>  SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
> -SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
> -
> +SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> index eff245d..383e645 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> @@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
>  SRCREV_machine_qemux86-64 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
>  SRCREV_machine_qemumips64 ?= "8d21f71847640fc052bda1bf1f3792634cae5bb1"
>  SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
> -SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
> +SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

--001a113490fa70347404eb282e76
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-linux-yocto-3.10-meta-ARM-OMAP3-Add-USB-PHY-driver-f.patch"
Content-Disposition: attachment; 
	filename="0001-linux-yocto-3.10-meta-ARM-OMAP3-Add-USB-PHY-driver-f.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ho0edean0

RnJvbSAxZWNkYmI3MzdjZDA5YjJiMTg0YWIxMDNkY2Y0YzQyMmYzZDI3ZGY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogV2VkLCAxMyBOb3YgMjAxMyAxMTo0MDoxMCAtMDUwMApTdWJqZWN0OiBb
UEFUQ0hdIGxpbnV4LXlvY3RvLzMuMTA6ICBtZXRhOiBBUk06IE9NQVAzOiBBZGQgVVNCIFBIWSBk
cml2ZXIgZm9yCiBCZWFnbGVib2FyZAoKVXBkYXRpbmcgdGhlIG1ldGEgYnJhbmNoIFNSQ1JFViB0
byB1cGRhdGUgdGhlIFVTQiBjb25maWd1cmF0aW9uOgoKICAgIFRoZSBCZWFnbGVib2FyZCBuZWVk
cyB0aGUgVVNCIFBIWSBkcml2ZXJzIGluIHRoZSBrZXJuZWwgaW4gb3JkZXIgdG8gZW5hYmxlCiAg
ICBVU0IgYW5kIEV0aGVybmV0IGZ1bmN0aW9uYWxpdHkuIFRoaXMgZml4IGVuc3VyZXMgdGhhdCB0
aGV5IGFyZSBidWlsdCBpbgogICAgYnkgdHdlYWtpbmcgdGhlIGtlcm5lbCBjb25maWcuCgogICAg
VGVzdGVkIG9uIEJlYWdsZWJvYXJkIHhNIFJldi4gQzIuCgpTaWduZWQtb2ZmLWJ5OiBCcnVjZSBB
c2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJpdmVyLmNvbT4KLS0tCiBtZXRhL3JlY2lwZXMt
a2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXJ0XzMuMTAuYmIgICB8IDIgKy0KIG1ldGEvcmVjaXBl
cy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tdGlueV8zLjEwLmJiIHwgMyArLS0KIG1ldGEvcmVj
aXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fMy4xMC5iYiAgICAgIHwgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF8zLjEwLmJiIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1ydF8zLjEwLmJiCmluZGV4IGFiOTVhZDEu
LmFiMzZlNmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9j
dG8tcnRfMy4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3Rv
LXJ0XzMuMTAuYmIKQEAgLTUsNyArNSw3IEBAIEtCUkFOQ0hfcWVtdXBwYyA9ICJzdGFuZGFyZC9w
cmVlbXB0LXJ0L3FlbXVwcGMiCiAKIFNSQ1JFVl9tYWNoaW5lID89ICI5NzQ5OWRmYWVhNjE5MzQ3
MTliOTFmMTM0N2Y0NjhjNmYwMTI1YjJjIgogU1JDUkVWX21hY2hpbmVfcWVtdXBwYyA/PSAiNTRj
YjRlZmEwMzNhZjg2MzAxOTM0ZDU4ZDg5MGE1MzI0Y2M5NWE3NSIKLVNSQ1JFVl9tZXRhID89ICJm
MWM5MDgwY2QyN2Y5OTcwMGZhNTliNTM3NWQxZGRkMGFmZTYyNWFkIgorU1JDUkVWX21ldGEgPz0g
ImMxNmEyY2Y3YjA2YzkyYTAyMTdkNjE1NjliZDAyOTMyMzNmZTZiYTciCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbGludXgteW9jdG8tMy4xMC5naXQ7YmFyZWNsb25l
PTE7YnJhbmNoPSR7S0JSQU5DSH0sbWV0YTtuYW1lPW1hY2hpbmUsbWV0YSIKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by10aW55XzMuMTAuYmIgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLXRpbnlfMy4xMC5iYgppbmRleCBj
MTVjMzExLi42YmQ4YWU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvLXRpbnlfMy4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LXlvY3RvLXRpbnlfMy4xMC5iYgpAQCAtMTAsOCArMTAsNyBAQCBMSU5VWF9WRVJTSU9OID89
ICIzLjEwLjE3IgogS01FVEEgPSAibWV0YSIKIAogU1JDUkVWX21hY2hpbmUgPz0gImMwMzE5NWVk
NmUzMDY2NDk0ZTNmYjRiZTY5MTU0YTU3MDY2ZTg0NWIiCi1TUkNSRVZfbWV0YSA/PSAiZjFjOTA4
MGNkMjdmOTk3MDBmYTU5YjUzNzVkMWRkZDBhZmU2MjVhZCIKLQorU1JDUkVWX21ldGEgPz0gIjZh
ZDIwZjA0OWFiZDUyYjUxNWE4ZTBhNDY2NDg2MWNmZDMzMWY2ODQiCiAKIFBWID0gIiR7TElOVVhf
VkVSU0lPTn0rZ2l0JHtTUkNQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bGludXgvbGludXgteW9jdG9fMy4xMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGlu
dXgteW9jdG9fMy4xMC5iYgppbmRleCBlZmYyNDVkLi4xZjFhOWRjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvXzMuMTAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b18zLjEwLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNS
Q1JFVl9tYWNoaW5lX3FlbXV4ODYgPz0gImMwMzE5NWVkNmUzMDY2NDk0ZTNmYjRiZTY5MTU0YTU3
MDY2ZTg0NWIiCiBTUkNSRVZfbWFjaGluZV9xZW11eDg2LTY0ID89ICJjMDMxOTVlZDZlMzA2NjQ5
NGUzZmI0YmU2OTE1NGE1NzA2NmU4NDViIgogU1JDUkVWX21hY2hpbmVfcWVtdW1pcHM2NCA/PSAi
OGQyMWY3MTg0NzY0MGZjMDUyYmRhMWJmMWYzNzkyNjM0Y2FlNWJiMSIKIFNSQ1JFVl9tYWNoaW5l
ID89ICJjMDMxOTVlZDZlMzA2NjQ5NGUzZmI0YmU2OTE1NGE1NzA2NmU4NDViIgotU1JDUkVWX21l
dGEgPz0gImYxYzkwODBjZDI3Zjk5NzAwZmE1OWI1Mzc1ZDFkZGQwYWZlNjI1YWQiCitTUkNSRVZf
bWV0YSA/PSAiNmFkMjBmMDQ5YWJkNTJiNTE1YThlMGE0NjY0ODYxY2ZkMzMxZjY4NCIKIAogU1JD
X1VSSSA9ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9saW51eC15b2N0by0zLjEwLmdpdDti
YXJlY2xvbmU9MTticmFuY2g9JHtLQlJBTkNIfSwke0tNRVRBfTtuYW1lPW1hY2hpbmUsbWV0YSIK
IAotLSAKMS44LjEuMgoK

--001a113490fa70347404eb282e76--
