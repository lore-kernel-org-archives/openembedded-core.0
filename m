Return-Path: <Sebastian.Wiegand@gersys.de>
Received: from mout.kundenserver.de (unknown [212.227.126.187])
	by mail.openembedded.org (Postfix) with ESMTP id B676565EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:58:41 +0000 (UTC)
Received: from remote.gersys.de (p50991dcb.dip0.t-ipconnect.de [80.153.29.203])
	by mrelayeu.kundenserver.de (node=mreue001) with ESMTP (Nemesis)
	id 0MZsqM-1WSzTY0JfK-00LTMn; Thu, 22 May 2014 11:58:42 +0200
Received: from [127.0.0.1] (192.168.16.104) by GERSYS-r710.gersys.local
	(192.168.16.50) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Thu, 22 May 2014 11:58:40 +0200
Message-ID: <537DCA50.2020106@gersys.de>
Date: Thu, 22 May 2014 11:58:40 +0200
From: Sebastian Wiegand <sebastian.wiegand@gersys.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>, Saul Wold <sgw@linux.intel.com>
References: <CAPbeDCmO-PZOr+8uohAQy5cQR4LPV+-3=048hhLWAijuU5cNWg@mail.gmail.com>
In-Reply-To: <CAPbeDCmO-PZOr+8uohAQy5cQR4LPV+-3=048hhLWAijuU5cNWg@mail.gmail.com>
X-Originating-IP: [192.168.16.104]
X-EXCLAIMER-MD-CONFIG: b9d14dc3-f764-4fff-b0ad-ab9b13f2383d
X-Provags-ID: V02:K0:YX2FNibY3ti4v+cbeRKLC1xl9WjuSG8275xFo1/avHd
	YxiY6kwP60tRaIyYYT5sTCBWW3dzm5/kWF9CtM6jkWRDRdKJ+Q
	gwf0O2Wvu8ZVvFxQlJrCP5hQItJGN2EXp3x68n0zDdYKSj9D+A
	Eh/QyTGtjvF2G0uwGV+JmuCRRg8l8lexhx4ygYDOn/Vij6Arrq
	JKlmDJoM/6oH5aE78mCfk9BwiBZRe1sCeo/imoN5ijMW4n/Ejh
	AQLLRiZKG/nk0dnNBkle58vLxpyvwCM9HyYFq+D7QlE9QRwMGl
	zQYuIImYJiue8/EqtyPZ+YwDBM1xUpwLMfpXXU8EJZT3UvOv45
	hQD97HKS7JDQqZc/s8w4=
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/16] CVE Patches and updates
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
X-List-Received-Date: Thu, 22 May 2014 09:58:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

  Hi,

On Thursday, 22.05.2014 08:57 +0200, Jacob Kroon wrote:
> Hi,
>
> On Wed, May 21, 2014 at 8:01 PM, Saul Wold <sgw@linux.intel.com 
> <mailto:sgw@linux.intel.com>> wrote:
>
>     Richard,
>
>     Another set of CVE fixes and some Updates.
>
>     Thanks
>             Sau!
>
>     The following changes since commit
>     7decf9dce56868e39902dac5957eb72f6e1e9acd:
>
>       cups: fix for cups not building without avahi (2014-05-21
>     09:08:11 +0100)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> sgw/stage
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
>     Chong Lu (3):
>       flex: Update to 2.5.39 version
>       byacc: Update to 20140422 version
>       guile: Update to 2.0.11 version
>
>     Sebastian Wiegand (1):
>       distro_features_check.bbclass: fix wrong indentation
>
>
> Doesn't this commit, 986db87a3931edce8be79f309d07497e4179a810, only 
> check that the first required distro feature found is available,  and 
> skips checking the remaining ?
>
> Shouldnt we do something like this
>
> diff --git a/meta/classes/distro_features_check.bbclass 
> b/meta/classes/distro_features_check.bbclass
> index 61b11b7..b728bdc 100644
> --- a/meta/classes/distro_features_check.bbclass
> +++ b/meta/classes/distro_features_check.bbclass
> @@ -14,9 +14,9 @@ python () {
>          distro_features = (d.getVar('DISTRO_FEATURES', True) or 
> "").split()
>          for f in required_distro_features:
>              if f in distro_features:
> -                break
> -        else:
> -            raise bb.parse.SkipPackage("missing required distro 
> feature %s (not in DISTRO_FEATURES)" % required_distro_features)
> +                continue
> +            else:
> +                raise bb.parse.SkipPackage("missing required distro 
> feature %s (not in DISTRO_FEATURES)" % required_distro_features)
>
>      conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
>      if conflict_distro_features:
>
> /Jacob

Reworked and fixed the error message, too.

Search whole list of REQUIRED_DISTRO_FEATURES.
Print only the missing/conflicting feature on error.
---
  meta/classes/distro_features_check.bbclass |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/distro_features_check.bbclass 
b/meta/classes/distro_features_check.bbclass
index 8a0ecb7..1f1d6fb 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -14,9 +14,9 @@ python () {
          distro_features = (d.getVar('DISTRO_FEATURES', True) or 
"").split()
          for f in required_distro_features:
              if f in distro_features:
-                break
+                continue
              else:
-                raise bb.parse.SkipPackage("missing required distro 
feature %s (not in DISTRO_FEATURES)" % required_distro_features)
+                raise bb.parse.SkipPackage("missing required distro 
feature '%s' (not in DISTRO_FEATURES)" % f)

      conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
      if conflict_distro_features:
@@ -24,5 +24,5 @@ python () {
          distro_features = (d.getVar('DISTRO_FEATURES', True) or 
"").split()
          for f in conflict_distro_features:
              if f in distro_features:
-                raise bb.parse.SkipPackage("conflicting distro feature 
%s (in DISTRO_FEATURES)" % conflict_distro_features)
+                raise bb.parse.SkipPackage("conflicting distro feature 
'%s' (in DISTRO_FEATURES)" % f)
  }
-- 

Cheers,
Sebastian

