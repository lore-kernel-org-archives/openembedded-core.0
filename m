Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C61E973CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:20:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2015 04:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; 
	d="scan'208,223";a="712552118"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 17 Jun 2015 04:20:25 -0700
Message-ID: <1434540023.12084.69.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 17 Jun 2015 14:20:23 +0300
In-Reply-To: <2071087.3Bvkg31YSM@peggleto-mobl.ger.corp.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1434022456-26266-10-git-send-email-markus.lehtonen@linux.intel.com>
	<2071087.3Bvkg31YSM@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 09/10] devtool: remove some unused return values
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
X-List-Received-Date: Wed, 17 Jun 2015 11:20:30 -0000
X-Groupsio-MsgNum: 66835
Content-Type: multipart/mixed; boundary="=-54yo8cy+CJKafU6WKCmg"

--=-54yo8cy+CJKafU6WKCmg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

On Wed, 2015-06-17 at 10:36 +0100, Paul Eggleton wrote:
> On Thursday 11 June 2015 14:34:15 Markus Lehtonen wrote:
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  scripts/devtool                 | 1 -
> >  scripts/lib/devtool/standard.py | 3 ---
> >  2 files changed, 4 deletions(-)
> > 
> > diff --git a/scripts/devtool b/scripts/devtool
> > index 0100eb8..307846a 100755
> > --- a/scripts/devtool
> > +++ b/scripts/devtool
> > @@ -157,7 +157,6 @@ def _enable_workspace_layer(workspacedir, config,
> > basepath): bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
> > if not os.path.exists(bblayers_conf):
> >          logger.error('Unable to find bblayers.conf')
> > -        return -1
> 
> I appreciate the actually returned value might not be used, but simply 
> dropping the return entirely allows the function to continue after the error, 
> which is wrong.

Uh oh, stupid mistake. Thanks for spotting that!

You can find a fixed patch, attached. I also pushed a fixed version of
the patchset to
git://git.openembedded.org/openembedded-core-contrib
marquiz/devtool/refactor



Thanks,
  Markus

--=-54yo8cy+CJKafU6WKCmg
Content-Disposition: attachment;
	filename="v3-0009-devtool-remove-some-unused-return-values.patch"
Content-Type: text/x-patch;
	name="v3-0009-devtool-remove-some-unused-return-values.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAzMDQwMWE0ZjA3NTA1N2UwYzhlY2E5YWFhYWU3ZTQ1NTkxYmFmN2M0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJrdXMgTGVodG9uZW4gPG1hcmt1cy5sZWh0b25lbkBsaW51
eC5pbnRlbC5jb20+CkRhdGU6IFdlZCwgMjcgTWF5IDIwMTUgMTc6NDA6NDkgKzAzMDAKU3ViamVj
dDogW1BBVENIIHYzIDA5LzEwXSBkZXZ0b29sOiByZW1vdmUgc29tZSB1bnVzZWQgcmV0dXJuIHZh
bHVlcwoKU2lnbmVkLW9mZi1ieTogTWFya3VzIExlaHRvbmVuIDxtYXJrdXMubGVodG9uZW5AbGlu
dXguaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvZGV2dG9vbCAgICAgICAgICAgICAgICAgfCAyICst
CiBzY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5kYXJkLnB5IHwgMyAtLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9k
ZXZ0b29sIGIvc2NyaXB0cy9kZXZ0b29sCmluZGV4IDAxMDBlYjguLmZkNGFmOTggMTAwNzU1Ci0t
LSBhL3NjcmlwdHMvZGV2dG9vbAorKysgYi9zY3JpcHRzL2RldnRvb2wKQEAgLTE1Nyw3ICsxNTcs
NyBAQCBkZWYgX2VuYWJsZV93b3Jrc3BhY2VfbGF5ZXIod29ya3NwYWNlZGlyLCBjb25maWcsIGJh
c2VwYXRoKToKICAgICBiYmxheWVyc19jb25mID0gb3MucGF0aC5qb2luKGJhc2VwYXRoLCAnY29u
ZicsICdiYmxheWVycy5jb25mJykKICAgICBpZiBub3Qgb3MucGF0aC5leGlzdHMoYmJsYXllcnNf
Y29uZik6CiAgICAgICAgIGxvZ2dlci5lcnJvcignVW5hYmxlIHRvIGZpbmQgYmJsYXllcnMuY29u
ZicpCi0gICAgICAgIHJldHVybiAtMQorICAgICAgICByZXR1cm4KICAgICBfLCBhZGRlZCA9IGJi
LnV0aWxzLmVkaXRfYmJsYXllcnNfY29uZihiYmxheWVyc19jb25mLCB3b3Jrc3BhY2VkaXIsIGNv
bmZpZy53b3Jrc3BhY2VfcGF0aCkKICAgICBpZiBhZGRlZDoKICAgICAgICAgbG9nZ2VyLmluZm8o
J0VuYWJsaW5nIHdvcmtzcGFjZSBsYXllciBpbiBiYmxheWVycy5jb25mJykKZGlmZiAtLWdpdCBh
L3NjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0
YW5kYXJkLnB5CmluZGV4IGZiM2NjNzguLjE0OTEyYTkgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvbGli
L2RldnRvb2wvc3RhbmRhcmQucHkKKysrIGIvc2NyaXB0cy9saWIvZGV2dG9vbC9zdGFuZGFyZC5w
eQpAQCAtNDE3LDkgKzQxNyw2IEBAIGRlZiBfY2hlY2tfcHJlc2VydmUoY29uZmlnLCByZWNpcGVu
YW1lKToKICAgICAgICAgICAgICAgICAgICAgdGYud3JpdGUobGluZSkKICAgICBvcy5yZW5hbWUo
bmV3ZmlsZSwgb3JpZ2ZpbGUpCiAKLSAgICByZXR1cm4gRmFsc2UKLQotCiBkZWYgbW9kaWZ5KGFy
Z3MsIGNvbmZpZywgYmFzZXBhdGgsIHdvcmtzcGFjZSk6CiAgICAgIiIiRW50cnkgcG9pbnQgZm9y
IHRoZSBkZXZ0b29sICdtb2RpZnknIHN1YmNvbW1hbmQiIiIKICAgICBpbXBvcnQgYmIKLS0gCjIu
MS40Cgo=

--=-54yo8cy+CJKafU6WKCmg--
