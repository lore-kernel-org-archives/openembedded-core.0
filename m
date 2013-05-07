Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UZmQ7-00016c-E0
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 20:15:23 +0200
Received: by mail-wg0-f45.google.com with SMTP id l18so970862wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=iidUCD5fnDhchSAx7THilCvEiQePQCO+7e4U7RxPSvk=;
	b=q67bsUpnHVIc2dk9Qj06TbT/vn2uS48k+SxcLbbeA4DIYkSsbG0zRecS5KltFJRK3C
	8Mm7ev8RJX6zBuzmaY+dgu9xVl+CmWUW0rF5apSibJ1lU/57ak3vxtcigGyrJOpSlESZ
	hg/O2CwPln4+8tSmeqeJBJgAuch9H7Wb3xol/dvIwC3g5aVwD05sz3jXa7eL+WNPAyWY
	Pk15iPTjWzQX4hL4q8XOo2yH3sqsADYPYQZF53JT4au+6b4YBRAzKsxyhdpmx7L801jG
	JEjB/6FWF4Vfugr8N45ArWDuAI14fqzY3YuMLzwDl10gqgKdip4Glv2vF8g4gJ6r2vbw
	iK2Q==
MIME-Version: 1.0
X-Received: by 10.180.73.206 with SMTP id n14mr16486944wiv.27.1367949442169;
	Tue, 07 May 2013 10:57:22 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Tue, 7 May 2013 10:57:21 -0700 (PDT)
In-Reply-To: <CAJTo0LaUSyekgycP37-jZnHmgy1wOM-PfJ0yZQtMrSP_bUp8hg@mail.gmail.com>
References: <1367930701.27116.31.camel@ted>
	<CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
	<CAJTo0LaUSyekgycP37-jZnHmgy1wOM-PfJ0yZQtMrSP_bUp8hg@mail.gmail.com>
Date: Tue, 7 May 2013 13:57:21 -0400
Message-ID: <CAHUNapTCr_YV+pfCJod6LcGfhGh4HEX+GmcQSFQ9frFS+HiecQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Status Update
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
X-List-Received-Date: Tue, 07 May 2013 18:15:23 -0000
X-Groupsio-MsgNum: 38829
Content-Type: multipart/mixed; boundary=f46d0435c5fc92436704dc248cd3

--f46d0435c5fc92436704dc248cd3
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 1:13 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> I have a patch for Danny to allow qemu-native of qemu-1.2.0 to compile
>> on openSuSE 12.3 (which, apparently, is also affected by the same (or
>> a similar) DSO linking change that affects fedora). Are the queued
>> changes available somewhere so I can check this hasn't already been
>> applied?
>
> The merged changes are in the "danny" branch of the oe-core and poky,
> and there's a ross/danny-next branch in openembedded-core-contrib that
> is my staging area for submissions to danny.

I've looked through the list of patches and don't seem to find
anything that will do what my patch needs to do in order to build
qemu-1.2.0 on openSuSE 12.3. Would you consider adding the attached
patch for Danny? (normally I'd send it in-line but I'm behind a
firewall at the moment that won't allow "git send-email" to succeed,
otherwise I could submit it this evening)

--f46d0435c5fc92436704dc248cd3
Content-Type: application/octet-stream; 
	name="0001-qemu-native-fix-DSO-linking.patch"
Content-Disposition: attachment; 
	filename="0001-qemu-native-fix-DSO-linking.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hgfdq8mo0

RnJvbSBhNGFkYTY1ZTY4Y2VjZTQ3N2VmNzYwOTk1YWUzMzk1Y2M3ZGQyN2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUcmV2b3IgV29lcm5lciA8dHdvZXJuZXJAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDcgTWF5IDIwMTMgMTM6Mzc6MTQgLTA0MDAKU3ViamVjdDogW1BBVENIXVtkYW5u
eV0gcWVtdS1uYXRpdmU6IGZpeCBEU08gbGlua2luZwoKSSBub3RpY2VkIHRoaXMgaXNzdWUgdHJ5
aW5nIHRvIGJ1aWxkIHVzaW5nIHRoZSBEYW5ueSBicmFuY2ggb24gd2hhdCBpcwpjdXJyZW50bHkg
dGhlIG1vc3QgcmVjZW50IG9wZW5TdVNFICgxMi4zKS4gSXQgYXBwZWFycyB0byBiZSBzaW1pbGFy
IHRvIHRoZQpmZWRvcmEgRFNPIGxpbmtpbmcgaXNzdWU6Cmh0dHBzOi8vZmVkb3JhcHJvamVjdC5v
cmcvd2lraS9VbmRlcnN0YW5kaW5nRFNPTGlua0NoYW5nZS4KClVwc3RyZWFtLXN0YXR1czogSW5h
cHByb3ByaWF0ZSBbT0UgU3BlY2lmaWNdClNpZ25lZC1vZmYtYnk6IFRyZXZvciBXb2VybmVyIDx0
d29lcm5lckBnbWFpbC5jb20+Ci0tLQogLi4uL3FlbXUvcWVtdS0xLjIuMC9saW5rZXItZmxhZ3Mt
Mi5wYXRjaCAgICAgICAgICAgfCAgIDI2ICsrKysrKysrKysrKysrKysrKysrCiBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEuMi4wLmJiICAgICAgICAgICB8ICAgIDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS0xLjIuMC9saW5rZXItZmxhZ3MtMi5wYXRjaAoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtMS4yLjAvbGlua2VyLWZsYWdz
LTIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LTEuMi4wL2xpbmtlci1m
bGFncy0yLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmJhNTBjOGQK
LS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LTEuMi4w
L2xpbmtlci1mbGFncy0yLnBhdGNoCkBAIC0wLDAgKzEsMjYgQEAKK2RpZmYgLXVyTiBxZW11LTEu
Mi4wLm9yaWcvTWFrZWZpbGUgcWVtdS0xLjIuMC9NYWtlZmlsZQorLS0tIHFlbXUtMS4yLjAub3Jp
Zy9NYWtlZmlsZQkyMDEyLTA5LTA1IDEwOjAzOjA2LjAwMDAwMDAwMCAtMDQwMAorKysrIHFlbXUt
MS4yLjAvTWFrZWZpbGUJMjAxMy0wNS0wNyAxMjoxODoyMy42Mzg1NjA1OTEgLTA0MDAKK0BAIC0x
NzIsNyArMTcyLDcgQEAKKyBxZW11LWltZy1jbWRzLmg6ICQoU1JDX1BBVEgpL3FlbXUtaW1nLWNt
ZHMuaHgKKyAJJChjYWxsIHF1aWV0LWNvbW1hbmQsc2ggJChTUkNfUEFUSCkvc2NyaXB0cy9oeHRv
b2wgLWggPCAkPCA+ICRALCIgIEdFTiAgICRAIikKKyAKKy1xZW11LWdhJChFWEVTVUYpOiBMSUJT
ID0gJChMSUJTX1FHQSkKKytxZW11LWdhJChFWEVTVUYpOiBMSUJTID0gJChMSUJTX1FHQSkgLWxy
dAorIHFlbXUtZ2EkKEVYRVNVRik6IFFFTVVfQ0ZMQUdTICs9IC1JIHFnYS9xYXBpLWdlbmVyYXRl
ZAorIAorIGdlbi1vdXQtdHlwZSA9ICQoc3Vic3QgLiwtLCQoc3VmZml4ICRAKSkKK2RpZmYgLXVy
TiBxZW11LTEuMi4wLm9yaWcvY29uZmlndXJlIHFlbXUtMS4yLjAvY29uZmlndXJlCistLS0gcWVt
dS0xLjIuMC5vcmlnL2NvbmZpZ3VyZQkyMDEyLTA5LTA1IDEwOjAzOjA2LjAwMDAwMDAwMCAtMDQw
MAorKysrIHFlbXUtMS4yLjAvY29uZmlndXJlCTIwMTMtMDUtMDcgMTI6MTE6MDYuOTQwMzA3NDU1
IC0wNDAwCitAQCAtMjY4MSw2ICsyNjgxLDEwIEBACisgICBMSUJTPSItbHJ0ICRMSUJTIgorIGZp
CisgCisraWYgdGVzdCAiJGxpbnV4IiA9ICJ5ZXMiIDsgdGhlbgorKyAgTElCUz0iLWxydCAkTElC
UyIKKytmaQorKworIGlmIHRlc3QgIiRkYXJ3aW4iICE9ICJ5ZXMiIC1hICIkbWluZ3czMiIgIT0g
InllcyIgLWEgIiRzb2xhcmlzIiAhPSB5ZXMgLWEgXAorICAgICAgICAgIiRhaXgiICE9ICJ5ZXMi
IC1hICIkaGFpa3UiICE9ICJ5ZXMiIDsgdGhlbgorICAgICBsaWJzX3NvZnRtbXU9Ii1sdXRpbCAk
bGlic19zb2Z0bW11IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dV8xLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMS4yLjAuYmIKaW5k
ZXggNTE3YTc0Yi4uN2E4MWYwYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdV8xLjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEu
Mi4wLmJiCkBAIC04LDYgKzgsNyBAQCBTUkNfVVJJID0gIlwKICAgICBmaWxlOi8vcG93ZXJwY19y
b20uYmluIFwKICAgICBmaWxlOi8vbm8tc3RyaXAucGF0Y2ggXAogICAgIGZpbGU6Ly9saW5rZXIt
ZmxhZ3MucGF0Y2ggXAorICAgIGZpbGU6Ly9saW5rZXItZmxhZ3MtMi5wYXRjaCBcCiAgICAgZmls
ZTovL3FlbXUtdm13YXJlLXZnYS1kZXB0aC5wYXRjaCBcCiAgICAgZmlsZTovL2ZpeC1jb25maWd1
cmUtY2hlY2tzLnBhdGNoIFwKICAgICBmaWxlOi8vZmFsbGJhY2stdG8tc2FmZS1tbWFwX21pbl9h
ZGRyLnBhdGNoIFwKLS0gCjEuNy4xMC5HSVQKCg==

--f46d0435c5fc92436704dc248cd3--
