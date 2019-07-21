Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4590D7ED2F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 20:31:17 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id 190so24803968vsf.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tRCYhOalJ4odtbEda2fOKeTDWGKt89hf98fsvcbuhdc=;
	b=j3YV2LSbmFga7302I7A47gaTI0y041zRS3dZlqUvv4q5v/7hsV+qs05VxpGnKZFRsj
	wrQY8pXdzWdUlwxdPWw3S4rgSsl45+6d9Nu9WsLBNF9VmpLkbEJJqAGchqIxLftpHf/p
	7I5i65gtHfPu78H9fAtOgjZ5HC/3kqmZxrkKHc6sr8r/VhhUtYSf8qFD8ETscbIgr8fi
	uhBbdwPRbd2nFUXZD6JBaINLpK8eBkZUj752d6Co5jWtUqbI3MYjjsh7nw1eop9fVO0V
	9F7FjQsqlw4WYJI7BWLaBahycnwPKIQzJabVztBDtZg10KHq0yGIogufxKfHm+UHuE8H
	kSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tRCYhOalJ4odtbEda2fOKeTDWGKt89hf98fsvcbuhdc=;
	b=Fw/Z+L8g3n+AZ/G4rwHDqoHLC2s+5ARd9B8mO+ETmqAK3owpWn+JdzWeu5b017iSGl
	2iFeXR2jeB2ZMXjiogGzz44IELjMD2om73QcUT3JFlbMkboxFmlKMM5dMPzFRl8KMcb1
	35NV096bPunWxipcxJLzAQ40argFxl+/mAhWsPGAxbjm1vJz/eC6pQOmUAwgV6z3FHmq
	qBTwvmgFh/lP3iKp8vyMXFIlNWwxkD7PyGSQi50rOuIolR//pjyPuTexM+kEOGvoP+tN
	zFAXgP+QTkvXyLE1P8XAS2vZ/5mazn+4ZSwpkb1/gecYYE2fSkod0SUtmxXLy6ITcy9n
	w3cA==
X-Gm-Message-State: APjAAAUSOtPRkycE/R381tPIHAw8GInwuiRVeOI9FTKYRM7elTQnY7gG
	xfv7p6o/esrVa3piIovsS6qP7GANQiLcj9+Ud4Y=
X-Google-Smtp-Source: APXvYqwoQ3+aL5QfkYic/ZfFBmtky4HiskLurJGmNSg/7u5CSs/7PvRuzqxQ/clEjMNB7VuwrGPYA9GhEFe7wptBRnk=
X-Received: by 2002:a67:b14c:: with SMTP id z12mr37755765vsl.11.1563741077990; 
	Sun, 21 Jul 2019 13:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
	<CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
	<CAJ86T=UTXq=aPkTRV1U+aN71KO3hCyz+fsT45=Mbm8ALZvPmiA@mail.gmail.com>
	<CAMKF1squ8mH9Aq9k1j9PZ=KDPp02DagQtuf9tWrrSqZ6XEMr4A@mail.gmail.com>
	<1467757624.8590.207.camel@linuxfoundation.org>
	<CAJ86T=XjCQjTANa4g8ztdxQCRggGgn7QkYMa6Y1+3QTAOdSyjg@mail.gmail.com>
	<CAP71WjyC=tyfebrf0sitvc36DqOhxN6ZQoWXf7spFazd=H=GpQ@mail.gmail.com>
In-Reply-To: <CAP71WjyC=tyfebrf0sitvc36DqOhxN6ZQoWXf7spFazd=H=GpQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 21 Jul 2019 13:31:06 -0700
Message-ID: <CAJ86T=WngspWTwFAK4y+WN1wvzgN9EwJQ9V_YgUGYJ=7n1Omaw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Sun, 21 Jul 2019 20:31:17 -0000
Content-Type: text/plain; charset="UTF-8"

 On Fri, Jul 19, 2019 at 1:09 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi Andre!

Hi Nico! :-)

> has anything more been done on that topic? I happen to now need
> something similar. E.g. packaging for proprietary content, and google
> led me to this discussion. What's the recommended approach nowadays to
> deal with recipes for proprietary content? The use case is similar,
> when building internally, we want to build all sources, but when we
> distribute, we want to distribute all open source content +
> proprietary as blob, but with minimal (if not none) changes in the
> meta data.

I don't think there was any further public work on this topic. My own
private solution evolved somewhat to the class copied and pasted
below.

In the end it became a self contained solution which doesn't rely on
bin_package.bbclass. Instead it directly creates a tar file of the
proprietary binaries (based on the contents of ${PKGD}) and a
dedicated "mini recipe" to extract it. The party with access to the
proprietary source includes the class in the main recipe which builds
from source and then arranges for the resulting tar file and mini
recipe to be distributed to the parties who don't have source access.
In my case, hooks run on a CI build server pushed the mini recipe to a
meta layer git repo and the tar file to a server accessible via scp.
The consumers of the prebuilts therefore only needed to repo sync the
meta layer to get the latest updates.

----

DEPLOY_DIR_PREBUILT_RECIPES ?= "${DEPLOY_DIR}/prebuilt-recipes"
DEPLOY_DIR_PREBUILT_TARFILES ?= "${DEPLOY_DIR}/prebuilt-tarfiles"

BASEPV = "${@ d.getVar('PV', True).replace('AUTOINC+', '')}"

PREBUILT_PV ?= "prebuilt-${MACHINE}-${BASEPV}"
PREBUILT_TARFILE_BASENAME ?= "${BPN}-${PREBUILT_PV}"

PREBUILT_RECIPE ?=
"${DEPLOY_DIR_PREBUILT_RECIPES}/${BPN}_prebuilt-${MACHINE}.bb"
PREBUILT_TARFILE ?=
"${DEPLOY_DIR_PREBUILT_TARFILES}/${PREBUILT_TARFILE_BASENAME}.tar.bz2"

PREBUILT_SRC_URI_PREFIX ?= "http://localhost:8000/"
PREBUILT_SRC_URI_PATH ?= ""

PREBUILT_CREATE_TARFILE_DOTDONE ?= "true"

do_genprebuilt[depends] += "pbzip2-native:do_populate_sysroot"
do_genprebuilt[dirs] = "${DEPLOY_DIR_PREBUILT_RECIPES}
${DEPLOY_DIR_PREBUILT_TARFILES} ${WORKDIR}"

do_genprebuilt() {

    [ "${CLASSOVERRIDE}" != "class-target" ] && exit 0

    find package -type d -empty -o ! -type d | grep -v
'^package/usr/src' | grep -v '\.debug' | LC_ALL=C sort >
${PREBUILT_TARFILE}.files
    tar --transform "s|^package|${PREBUILT_TARFILE_BASENAME}|" --owner
0 --group 0 -T ${PREBUILT_TARFILE}.files -cvf - | pbzip2 >
${PREBUILT_TARFILE}
    rm ${PREBUILT_TARFILE}.files

    [ "${PREBUILT_CREATE_TARFILE_DOTDONE}" = "true" ] && touch
${PREBUILT_TARFILE}.done

    # ------------------------------------------------------------------------

    s='$''{S}'
    d='$''{D}'
    bp='$''{BP}'
    ma='$''{MACHINE_ARCH}'
    pn='$''{PN}'
    wd='$''{WORKDIR}'
    openbracket='{'
    closebracket='}'

    md5=`md5sum < ${PREBUILT_TARFILE} | cut -c-32`
    sha256=`sha256sum < ${PREBUILT_TARFILE} | cut -c-64`

    # ------------------------------------------------------------------------

    cat << EOF > ${PREBUILT_RECIPE}

COMPATIBLE_MACHINE = "${MACHINE}"

PV = "${PREBUILT_PV}"

SRC_URI = "${PREBUILT_SRC_URI_PREFIX}${PREBUILT_SRC_URI_PATH}$bp.tar.bz2"

SRC_URI[md5sum] = "$md5"
SRC_URI[sha256sum] = "$sha256"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install () $openbracket
    tar -C $s --exclude='./patches' --exclude='./.pc' -cpf - . | tar
-C $d --no-same-owner -xpvf -
$closebracket

PACKAGE_ARCH = "$ma"

INSANE_SKIP_$pn += "already-stripped"
EOF

    # ------------------------------------------------------------------------
}

addtask do_genprebuilt after do_package before do_package_qa

----

