Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SaWSX-0001BZ-DZ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 20:20:25 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Jun 2012 11:09:51 -0700
Received: by lbbgh12 with SMTP id gh12so1642222lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 11:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=/N5Kpx6W3gAGjRyGkx9o/c5+QW6HMKUScH830FfOaNE=;
	b=lkLEZrABwU411MgpBAxWauG7Cv7LH1o/XU7F8UuWk3ySP3ARiaSQv+N0fmOu3teXtQ
	AAv99ubRp4q9IjKIcLgibgb+BK5jB6CEaDVOvFc9C5/WHJh+9kJazsE8/lfqzer8x4F1
	rzvSTfDYWFH7VCG2dgM0qffDu2BHh6BxmyatVABoqlMRKVqhaW9cOOGfViiDCPYd04vj
	m7u2nKu5VmtWLt1TPBGTvUMMALgl5WWJMi7fZmzzQGA1UTdJLa4VLlRNegKqEnngH51j
	yRezcQ+LT99NSi37HRJFSRCFzCcG29E/qOe+d5MpghtLsoKPkBM/lAK9ikqMZ5ZsoX83
	zQfA==
MIME-Version: 1.0
Received: by 10.152.123.244 with SMTP id md20mr4087633lab.0.1338574189278;
	Fri, 01 Jun 2012 11:09:49 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Fri, 1 Jun 2012 11:09:49 -0700 (PDT)
In-Reply-To: <4FC86B60.6040907@linux.intel.com>
References: <cover.1338420972.git.elizabeth.flanagan@intel.com>
	<6dcb3827885e1e0812656d44028df568903fb400.1338420972.git.elizabeth.flanagan@intel.com>
	<4FC86B60.6040907@linux.intel.com>
Date: Fri, 1 Jun 2012 11:09:49 -0700
Message-ID: <CAPhnLPB6_EijX7A2ZnCyHwuE4rX59yKyneeXo4igNFTsh8ToGw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlA7uF5Bjv6UZduj5CrOF+flH54f08UUKKv+sEXfc94pbrBif+kmrlKHUvsXYTtYjAvw+3W
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Adding PV to package.manifest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 18:20:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 12:12 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/30/2012 04:39 PM, Elizabeth Flanagan wrote:
>>
>> Per request, adding the package version to the package manifest
>> file.
>>
>> Signed-off-by: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
>> ---
>> =A0meta/classes/license.bbclass | =A0 =A02 ++
>> =A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
>> index 6c4a673..a537496 100644
>> --- a/meta/classes/license.bbclass
>> +++ b/meta/classes/license.bbclass
>> @@ -90,11 +90,13 @@ license_create_manifest() {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for filename in $files; do
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pkged_pn=3D"$(sed -n 's/^=
PN: //p' ${filename})"
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pkged_lic=3D"$(sed -n '/^=
LICENSE: /{ s/^LICENSE: //;
>> s/[+|&()*]/ /g; s/ =A0*/ /g; p }' ${filename})"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pkged_pv=3D"$(sed -n 's/^P=
V: //p' ${filename})"
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# check to see if the pac=
kage name exists in the
>> manifest. if so, bail.
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ! grep -q "PACKAGE NAM=
E: ${pkg}" ${filename};
>> then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# exclude=
 local recipes
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ ! "$=
{pkged_pn}" =3D "*locale*" ]; then
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0echo "PACKAGE NAME:" ${pkg}>>
>> =A0${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 echo "PACKAGE VERSION:"
>> ${pkged_pv}>> =A0${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0echo "RECIPE NAME:" ${pkged_pn}>>
>> =A0${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0echo "LICENSE: ">>
>> =A0${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0for lic in ${pkged_lic}; do
>
> Beth,
>
> Your patches don't seem to apply together, if I apply one the other fails=
 or
> the reverse.
>
> Can you rebase appropriately

In this case, I based both of them off of master as they're two
different issues and are unrelated too each other. I'll rebase this as
I pull together a mut for this afternoons AB run.

-b

>
> Sau!



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


