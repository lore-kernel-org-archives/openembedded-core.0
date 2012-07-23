Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1StDDh-000895-6Q
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:38:21 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 00:25:48 -0700
Received: by qcmv28 with SMTP id v28so2861931qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 00:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=mUC/nbSXPDTH8wbhcd1moLdvzKDlvu7LxzXAnqY1WHo=;
	b=cncQzVFSiHVWGJ5P5Ok8C8IFVj7gumkCA8aJwPK4xZGKoWKKXveu/JzJWlbK5lzgfD
	lBLUBJ8Uu5OFz3mFpZI5yc3+OACx+KQcNwSHOhEf2PFSLQXp8WEAb4NOZFKsMv3NWL6M
	zRsMYzmyJlByaYcPfMIsHpmbPBDE49qzBurGlDBEDIS6wIevD3XrSYTLnnVajEUEpRDd
	yr6P046ioOSOGJWtRvpqZeBdlc6xrHJtXKDB5H1Fs/U7y42DJvV14zIsgCJq0WOemsLZ
	c2TzlHGowKszkeXlAoHjjfD046Flc3c4aOtS8NRp8h+9nM58Dv9hbxm1qrI+OpSOAQHt
	XMGQ==
Received: by 10.224.42.68 with SMTP id r4mr23130434qae.84.1343028346724; Mon,
	23 Jul 2012 00:25:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.178.233 with HTTP; Mon, 23 Jul 2012 00:25:26 -0700 (PDT)
In-Reply-To: <CAMZjud2sBaiWWzMWFygJHaKqdQCd7bPr2RUHpv7nNW6mdHwb6w@mail.gmail.com>
References: <1342694032-31936-1-git-send-email-bogdan.a.marinescu@intel.com>
	<5008DFBE.4020707@linux.intel.com>
	<CAMZjud2sBaiWWzMWFygJHaKqdQCd7bPr2RUHpv7nNW6mdHwb6w@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Mon, 23 Jul 2012 10:25:26 +0300
Message-ID: <CAMZjud0YdFRnE5k9jmQFxPz5j3rJEak7vU115p1GukVHSr52hQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlRV7v/m4PpjCy5JWn67N7o5RDnOXwZAtG4Ex//DzfAM8WeVcX5DTJUP5HWJePZsQgxkQib
Subject: [PATCH] autoconf: updated to 2.69
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
X-List-Received-Date: Mon, 23 Jul 2012 07:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Resending to list (hit "reply" instead of "reply all" by mistake).


---------- Forwarded message ----------
From: Marinescu, Bogdan A <bogdan.a.marinescu@intel.com>
Date: Fri, Jul 20, 2012 at 10:46 AM
Subject: Re: [OE-core] [PATCH] autoconf: updated to 2.69
To: Saul Wold <sgw@linux.intel.com>


On Fri, Jul 20, 2012 at 7:34 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/19/2012 03:33 AM, Bogdan Marinescu wrote:
>>
>> Tested with core-image-sato-sdk and lib32-core-image-sato-sdk.
>> This update was done mainly because multilib builds failed on master with
>> this error:
>>
>> | autoreconf: running: aclocal -I
>> /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/
>> -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I
>> /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/
>> -I
>> /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/
>> -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I
>> /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/
>> --force --warnings=cross
>> | aclocal: warning: unknown warning category 'cross'
>> | configure.ac:18: error: Autoconf version 2.69 or higher is required
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
>>   .../{autoconf_2.68.bb => autoconf_2.69.bb}         |    4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-devtools/autoconf/{autoconf_2.68.bb =>
>> autoconf_2.69.bb} (85%)
>>
>> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc
>> b/meta/recipes-devtools/autoconf/autoconf.inc
>> index 3ae98c8..778c9a1 100644
>> --- a/meta/recipes-devtools/autoconf/autoconf.inc
>> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
>> @@ -12,7 +12,7 @@ RDEPENDS_${PN} = "m4 gnu-config"
>>   RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
>>   RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>>
>> -SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
>> +SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
>
>
> We support the .xz format also which is a tighter compression, why not use
> that one instead?  1.8M vs 1.2M (xz)

Using xz for autoconf leads to a chain of circular dependencies.
.tar.gz doesn't have this problem.

Thanks,
Bogdan

>
> Sau!
>
>
>>            file://program_prefix.patch"
>>
>>   inherit autotools
>> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
>> similarity index 85%
>> rename from meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> rename to meta/recipes-devtools/autoconf/autoconf_2.69.bb
>> index 8d466e0..478f8ed 100644
>> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> +++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
>> @@ -17,8 +17,8 @@ SRC_URI += "file://autoreconf-include.patch \
>>               file://remove-usr-local-lib-from-m4.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
>> -SRC_URI[sha256sum] =
>> "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
>> +SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
>> +SRC_URI[sha256sum] =
>> "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
>>
>>   SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
>>
>>
>


