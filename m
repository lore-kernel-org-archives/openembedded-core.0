Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UI4iW-0002AC-IN
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:09:13 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so1080817oag.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=loCI9kLAl4UddYtR5hJLdbJlCzKglb1g4MbrrEVlfDM=;
	b=tKEGAcFb/vf742W1jLwvRAzkGZyY/nelHWO1pym5hkZszGAz93/tHZ9On0SgHrqP0P
	L4Tq+ZynSNWZaofbGFcIu8XqO5TY+vQnLAzAd4xOOAsaItu+moZf0qzO/78LJ8BZlFUw
	ZinbXzxXwp8b3r36sgA4Gz1eRXqraqedhvRHq9WabVUrrE9nu22lRIHK1ru4I00Bhumu
	5NVY62W8yFKDhW4l80YjoIBjO+VIjesF3QJzpO3NQmYti1jp+bmTvuPM0h0zVFcSHqKa
	m4VaHo6QhPOaCnrfCkaSbgnIMJuWEhsAiY7QExHPKewHgjCpBRytEDEP0G2rDvi35fJE
	B+zQ==
MIME-Version: 1.0
X-Received: by 10.182.127.7 with SMTP id nc7mr2605734obb.94.1363729941996;
	Tue, 19 Mar 2013 14:52:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 19 Mar 2013 14:52:21 -0700 (PDT)
In-Reply-To: <1363716099-21136-2-git-send-email-jslater@windriver.com>
References: <1363716099-21136-1-git-send-email-jslater@windriver.com>
	<1363716099-21136-2-git-send-email-jslater@windriver.com>
Date: Tue, 19 Mar 2013 18:52:21 -0300
X-Google-Sender-Auth: aV4B_IH2Rj-U_KAChvWJFFErsQM
Message-ID: <CAP9ODKpWb2G9jwZ4HayTnLAePeO5utZ52YZHYrFuxsLuawdOCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH [v4] 1/1] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Tue, 19 Mar 2013 22:09:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 19, 2013 at 3:01 PM, Joe Slater <jslater@windriver.com> wrote:
> Rename and modifying existing recipes to use 2013b
> versions of time zone.
>
> Remove PR variables.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  ...code-native_2012j.bb => tzcode-native_2013b.bb} |   14 ++++++++------
>  .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |    5 ++---
>  2 files changed, 10 insertions(+), 9 deletions(-)
>  rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (51%)
>  rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (98%)
>
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb b/meta/recipes-extended/tzcode/tzcode-native_2013b.bb
> similarity index 51%
> rename from meta/recipes-extended/tzcode/tzcode-native_2012j.bb
> rename to meta/recipes-extended/tzcode/tzcode-native_2013b.bb
> index 938f072..24803b6 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2012j.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013b.bb
> @@ -1,16 +1,18 @@
>  DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
>  LICENSE = "PD"
> -PR = "r1"
> +

Drop this newline?

>  LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d27"
>
> +# note that we allow for us to use data later than our code version
> +#

What this comment means? I think it could be dropped (also it is not
recorded in commit log)

>  SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
> -           ftp://ftp.iana.org/tz/releases/tzdata2012j.tar.gz;name=tzdata"
> +           ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"

Please use ${PV} in the tar; it should work just fine.

> -SRC_URI[tzcode.md5sum] = "868b5d0dbf0e115ae4eb39a932ad0c4c"
> -SRC_URI[tzcode.sha256sum] = "ee4361b3b4ae201a270857c84d0f063c2a2191b3e4cd7414ea4622bb8bae9a82"
> -SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
> -SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
> +SRC_URI[tzcode.md5sum] = "c8bb91ce60092ef61d628d104ad3dab1"
> +SRC_URI[tzcode.sha256sum] = "fda9a8bd15f06939f0ecd1edba17d5e66d4d526632145609574459b250ab0efb"
> +SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
> +SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
>
>  S = "${WORKDIR}"
>
> diff --git a/meta/recipes-extended/tzdata/tzdata_2012j.bb b/meta/recipes-extended/tzdata/tzdata_2013b.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2012j.bb
> rename to meta/recipes-extended/tzdata/tzdata_2013b.bb
> index 25220cc..3561b33 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2013b.bb
> @@ -5,7 +5,6 @@ LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
>  DEPENDS = "tzcode-native"
>
> -PR = "r3"
>
>  inherit allarch
>
> @@ -16,8 +15,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
>
>  SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
>
> -SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
> -SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
> +SRC_URI[tzdata.md5sum] = "489dbca77d1f2e287a3987ca047bb246"
> +SRC_URI[tzdata.sha256sum] = "70d589d0e76a3749403d2bb404e9214c2520dda4c13e4b07b1b945ed2c64edb2"
>
>  S = "${WORKDIR}"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


