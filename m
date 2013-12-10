Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 524646DDB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:19:05 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so7476564pde.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 07:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CeIZy8w0X1JzxDz0jyhIcwiBxwfNzE++QTEU1w0Eba8=;
	b=ecbTeLZTiFLNRSK6Cg0ZFMy38WvPVhMhjV+vvsTESSOk7LD/U3u8lhsCRGs0Z9IW41
	/sQeob1V0I6xws8H5grQZjFieaGo9PnU91cd5T2MYQ/PiZ9nngyL9ojxpTcZ1YPglAV2
	2fVsyiUGmp7orWwSqJEXVREFh8JM7K1NfLC2bWWKh93/J6QcciytKMn8HsoACZL3Pi/U
	Pb8l5Q0zL8iYiNF0Hd1+4h6QTInCkPyu9IvAM0IIceJDW9IAUKqT0fhdKZlp8CFlgjlp
	pERiYq4iI2unSGaU71JWF/FE1byjv/QtJJEoy5ymSPaNRsQwLRbJmKFudYkoYr+Esu+1
	Q23w==
MIME-Version: 1.0
X-Received: by 10.68.173.132 with SMTP id bk4mr3535307pbc.169.1386688743549;
	Tue, 10 Dec 2013 07:19:03 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Tue, 10 Dec 2013 07:19:02 -0800 (PST)
In-Reply-To: <cover.1386688151.git.bruce.ashfield@windriver.com>
References: <cover.1386688151.git.bruce.ashfield@windriver.com>
Date: Tue, 10 Dec 2013 10:19:02 -0500
Message-ID: <CADkTA4Ow+7hNR3-wShbnnSWk7h4HZq2yNatq_84Cr5YKYzwjhw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto: static -dev SRCREVs and -headers for klibc
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
X-List-Received-Date: Tue, 10 Dec 2013 15:19:06 -0000
X-Groupsio-MsgNum: 48072
Content-Type: multipart/mixed; boundary=047d7b6d9b16f949a604ed2fa18b

--047d7b6d9b16f949a604ed2fa18b
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 10, 2013 at 10:16 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> Here are a couple of changes that I've been testing locally for a week now,
> with nothing (obvious) breaking.
>
> The linux-yocto-dev kernel change is to allow integration into master under
> test, so our dev kernels can be exercised directly before they become the
> kernel for a release. With this change, a layer can now create an optional
> include file, set a couple of variables and have a set of static REVs used
> rather than the default of AUTOREV.

I then proceeded to NOT include this patch in my rr directory, so it didn't
get sent.

I've attached it here and it is on the branch I referenced, but let me know
if you'd rather I do a complete resend.

Cheers,

Bruce

>
> The linux-libc-headers change fixes a klibc mips build failure issue found
> by Andrea Adami. This is fixed in the latest kernels, so we'll backport
> the change to the 3.10 based headers and drop it when I next uprev the
> kernel and headers.
>
> Cheers,
>
> Bruce
>
> cc: Andrea Adami <andrea.adami@gmail.com>
>
>
> The following changes since commit fc1bbe3654a3d456dfeb904f4c9752a03e3c48d6:
>
>   linux-yocto-dev: allow static SRCREVs via include (2013-12-10 10:06:09 -0500)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>   linux-libc-headers: fix MIPS klibc build error
>
>  ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_3.10.bb  |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
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

--047d7b6d9b16f949a604ed2fa18b
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-linux-yocto-dev-allow-static-SRCREVs-via-include.patch"
Content-Disposition: attachment; 
	filename="0001-linux-yocto-dev-allow-static-SRCREVs-via-include.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hp1ao16d0

RnJvbSBmYzFiYmUzNjU0YTNkNDU2ZGZlYjkwNGY0Yzk3NTJhMDNlM2M0OGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAd2luZHJp
dmVyLmNvbT4KRGF0ZTogVGh1LCA1IERlYyAyMDEzIDE0OjMxOjU1IC0wNTAwClN1YmplY3Q6IFtQ
QVRDSF0gbGludXgteW9jdG8tZGV2OiBhbGxvdyBzdGF0aWMgU1JDUkVWcyB2aWEgaW5jbHVkZQoK
VGhlIGxpbnV4LXlvY3RvIGRldiByZWNpcGUgaXMgaW50ZW5kZWQgdG8gdHJhY2sgdGhlIGxhdGVz
dCByZXZpc2lvbnMgb2YgdGhlCmtlcm5lbCB0cmVlIGJ5IGRlZmF1bHQuIFRvIGNvbnRyb2wgcmV2
aXNpb24gY2h1cm4sIGFuZCBpbnRlZ3JhdGUgaW50byBhCnJlZ3VsYXIgYnVpbGQgc2NoZWR1bGUg
aGF2aW5nIHRoZSBhYmlsaXR5IHRvIHNwZWNpZnkgYSBzZXQgb2YgU1JDUkVWcyB3aXRob3V0Cm1v
ZGlmeWluZyB0aGUgcmVjaXBlIGl0c2VsZiBpcyBkZXNpcmVkLgoKU28gd2UgaW50cm9kdWNlIGFu
IG9wdGlvbmFsIGluY2x1ZGUgZmlsZSwgYW5kIHZhcmlhYmxlcyB0aGF0IGNvbnRyb2wgd2hldGhl
cgpvciBub3QgdGhlIHN0YXRpYyBTUkNSRVZzIGFyZSB1c2VkOiBVU0VfTUFDSElORV9BVVRPUkVW
IGFuZCBVU0VfTUVUQV9BVVRPUkVWLAp0byBhZGQgdGhpcyBmbGV4aWJpbGl0eS4KClNpZ25lZC1v
ZmYtYnk6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEB3aW5kcml2ZXIuY29tPgotLS0K
IG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG8tZGV2LmJiIHwgMjUgKysrKysr
KysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51
eC15b2N0by1kZXYuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LXlvY3RvLWRl
di5iYgppbmRleCBlN2I4ZDhiMmE3YTEuLmU4ZDE0Yjk2NmQ4NCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1kZXYuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWtlcm5lbC9saW51eC9saW51eC15b2N0by1kZXYuYmIKQEAgLTExLDYgKzExLDEyIEBACiBpbmhl
cml0IGtlcm5lbAogcmVxdWlyZSByZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by5pbmMK
IAorVVNFX01BQ0hJTkVfQVVUT1JFViA/PSAiMSIKK1VTRV9NRVRBX0FVVE9SRVYgPz0gIjEiCisK
KyMgcHJvdmlkZSB0aGlzIC5pbmMgdG8gc2V0IHNwZWNpZmljIHJldmlzaW9ucworaW5jbHVkZSBy
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0by1kZXYtcmV2aXNpb25zLmluYworCiBLQlJB
TkNIID0gInN0YW5kYXJkL2Jhc2UiCiBLQlJBTkNIX0RFRkFVTFQgPSAiJHtLQlJBTkNIfSIKIEtN
RVRBID0gIm1ldGEiCkBAIC0yMiwxNSArMjgsMTkgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQucG9r
eWxpbnV4Lm9yZy9saW51eC15b2N0by1kZXYuZ2l0O25vY2hlY2tvdXQ9MTticmFuY2g9JHtLQlIK
ICMgbGludXgteW9jdG8tZGV2IGlzIHRoZSBwcmVmZXJyZWQgcHJvdmlkZXIsIHRoZXkgd2lsbCBi
ZSBvdmVycmlkZGVuIHRvCiAjIEFVVE9SRVYgaW4gZm9sbG93aW5nIGFub255bW91cyBweXRob24g
cm91dGluZSBhbmQgcmVzb2x2ZWQgd2hlbiB0aGUKICMgdmFyaWFibGVzIGFyZSBmaW5hbGl6ZWQu
Ci1TUkNSRVZfbWFjaGluZT0iMjk1OTQ0MDRkN2ZlNzNjZDgwZWFhNGVlOGM0M2RjYzUzOTcwYzYw
ZSIKLVNSQ1JFVl9tZXRhPSIyOTU5NDQwNGQ3ZmU3M2NkODBlYWE0ZWU4YzQzZGNjNTM5NzBjNjBl
IgorU1JDUkVWX21hY2hpbmUgPz0gIjI5NTk0NDA0ZDdmZTczY2Q4MGVhYTRlZThjNDNkY2M1Mzk3
MGM2MGUiCitTUkNSRVZfbWV0YSA/PSAiMjk1OTQ0MDRkN2ZlNzNjZDgwZWFhNGVlOGM0M2RjYzUz
OTcwYzYwZSIKIAogcHl0aG9uICgpIHsKICAgICBpZiBkLmdldFZhcigiUFJFRkVSUkVEX1BST1ZJ
REVSX3ZpcnR1YWwva2VybmVsIiwgVHJ1ZSkgIT0gImxpbnV4LXlvY3RvLWRldiI6CiAgICAgICAg
IHJhaXNlIGJiLnBhcnNlLlNraXBQYWNrYWdlKCJTZXQgUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1
YWwva2VybmVsIHRvIGxpbnV4LXlvY3RvLWRldiB0byBlbmFibGUgaXQiKQogICAgIGVsc2U6Ci0g
ICAgICAgIGQuc2V0VmFyKCJTUkNSRVZfbWFjaGluZSIsICIke0FVVE9SRVZ9IikKLSAgICAgICAg
ZC5zZXRWYXIoIlNSQ1JFVl9tZXRhIiwgIiR7QVVUT1JFVn0iKQorICAgICAgICAjIGlmIHRoZSBy
ZXZpc2lvbnMgaGF2ZSBiZWVuIGNoYW5nZWQgZnJvbSB0aGUgZGVmYXVsdHMgYWJvdmUgd2UgbGVh
dmUgdGhlbQorICAgICAgICAjIGFsb25lLiBCdXQgaWYgdGhlIGRlZmF1bHRzIGFyZSBsZWZ0LCB3
ZSBjaGFuZ2UgdG8gQVVUT1JFVi4KKyAgICAgICAgaWYgZC5nZXRWYXIoIlVTRV9NQUNISU5FX0FV
VE9SRVYiLCBUcnVlKSA9PSAiMSI6CisgICAgICAgICAgICBkLnNldFZhcigiU1JDUkVWX21hY2hp
bmUiLCAiJHtBVVRPUkVWfSIpCisgICAgICAgIGlmIGQuZ2V0VmFyKCJVU0VfTUVUQV9BVVRPUkVW
IiwgVHJ1ZSkgPT0gIjEiOgorICAgICAgICAgICAgZC5zZXRWYXIoIlNSQ1JFVl9tZXRhIiwgIiR7
QVVUT1JFVn0iKQogfQogCiBMSU5VWF9WRVJTSU9OID89ICIzLjEwKyIKQEAgLTQwLDggKzUwLDkg
QEAgUFYgPSAiJHtMSU5VWF9WRVJTSU9OfStnaXQke1NSQ1BWfSIKIENPTVBBVElCTEVfTUFDSElO
RSA9ICIocWVtdWFybXxxZW11eDg2fHFlbXVwcGN8cWVtdW1pcHN8cWVtdW1pcHM2NHxxZW11eDg2
LTY0KSIKIAogIyBGdW5jdGlvbmFsaXR5IGZsYWdzCi1LRVJORUxfRkVBVFVSRVNfYXBwZW5kID0g
IiBmZWF0dXJlcy9uZXRmaWx0ZXIvbmV0ZmlsdGVyLnNjYyIKLUtFUk5FTF9GRUFUVVJFU19hcHBl
bmRfcWVtdXg4Nj0iIGNmZy9zb3VuZC5zY2MiCitLRVJORUxfRVhUUkFfRkVBVFVSRVMgPz0gImZl
YXR1cmVzL25ldGZpbHRlci9uZXRmaWx0ZXIuc2NjIGZlYXR1cmVzL3Rhc2tzdGF0cy90YXNrc3Rh
dHMuc2NjIgorS0VSTkVMX0ZFQVRVUkVTX2FwcGVuZCA9ICIgJHtLRVJORUxfRVhUUkFfRkVBVFVS
RVN9IgorS0VSTkVMX0ZFQVRVUkVTX2FwcGVuZF9xZW11eDg2PSIgY2ZnL3NvdW5kLnNjYyBjZmcv
cGFyYXZpcnRfa3ZtLnNjYyIKIEtFUk5FTF9GRUFUVVJFU19hcHBlbmRfcWVtdXg4Ni02ND0iIGNm
Zy9zb3VuZC5zY2MiCi1LRVJORUxfRkVBVFVSRVNfYXBwZW5kX3FlbXV4ODY9IiBjZmcvcGFyYXZp
cnRfa3ZtLnNjYyIKIEtFUk5FTF9GRUFUVVJFU19hcHBlbmQgPSAiICR7QGJiLnV0aWxzLmNvbnRh
aW5zKCJUVU5FX0ZFQVRVUkVTIiwgIm14MzIiLCAiIGNmZy94MzIuc2NjIiwgIiIgLGQpfSIKKwot
LSAKMS44LjEuMgoK

--047d7b6d9b16f949a604ed2fa18b--
