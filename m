Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E53E6BC01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 12:17:55 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id m6so1575782oig.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=iKIBsId4qQSeQqG9aR9KxZXd6CkENz8J/j4L4bP/pMY=;
	b=giBApRVa9vDS2TeU0JkOlKRtaEkg/rVSZ0+q8HnHn1CbjfWLPZ+f1Udqa2kzAxaZnX
	vNASc8RTuHUnQ4jHPoVUrXQAIToRvBeCw2oS9iJbwsMSQqgEWtnEaWHTqPf66F6lu7Ee
	nM80kKwD9OAFdDh+MYNmTecwFeM4S8Utz7aTf7uAEKbP3THLHVJkfC9BJNrulApcmJO8
	uv9kdvC6F8ablcnaW4ZzQAz1jSwVsSyoxh10pg7vICJZVSU8tlC3xYua/67k+vL6ZyVw
	3NuF1gWOyJMBoAp0vTtokG9Emlzj6GJ5yn+rFHMiQnRe2t5guIBR9fIOUfe9FcV2udir
	v5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=iKIBsId4qQSeQqG9aR9KxZXd6CkENz8J/j4L4bP/pMY=;
	b=D9k1k5K/zGYE64rdWP/r1ObZ+ooffYQ1Y4vMBVuFCBTSJUuy16ojBU9k3BOxWj9vEC
	qRGVIzQUgMvjNoDjBitpT2kbt7ipwLGaL7l/8rlZyQhSXyMYcChzMOdoc2V/hYVsiFt4
	S4D74rY16je6JPWo8FWdDEPHzQMW+zuO9i1sPVWMVki0GrsktU+thzzUhBiRRb3K4bzd
	ATudkYlb0N+GsbdCRfpNggTPZbjEmjlE8hUxxOAY/jeFQ5tNTY9FttFO/ocnQpYRkQC4
	b8XRiHXFTEIHF/AlzjcuY0asdYDLCmjEfRZx7F6Hu+kgiJgA2cepJS834lB162gkmGER
	bYyQ==
X-Gm-Message-State: AJcUukeuxZ6Srf0D7EtSekaZ6pOp1HtKrN9txka2JCNg9nyMEzJmBkHR
	F/tXEw32U7uqPOBjDEE2P63c0U4n/ZmADW6BPKvAqwqOMck=
X-Google-Smtp-Source: ALg8bN5Xb/CXSJycu3fG2EzBnahLwF+4BmM8ZWPsWREHa9KZTgss3i/e3DVwG/70ota47VOrO2C6BvBD8/oaqqN93to=
X-Received: by 2002:aca:afd0:: with SMTP id y199mr1287588oie.6.1548245876141; 
	Wed, 23 Jan 2019 04:17:56 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UMd9LvewWZuiTSiJgW_J74E+kJ7Tfxmq7mXgzGjSekF9Q@mail.gmail.com>
In-Reply-To: <CABPh3UMd9LvewWZuiTSiJgW_J74E+kJ7Tfxmq7mXgzGjSekF9Q@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 23 Jan 2019 12:17:44 +0000
Message-ID: <CABPh3UOpcpnsyY_yvFM5SGeSsR6vt7_iELQMKx4CuWDJeJQhVA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image-buildinfo: make the build file shell compatible
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
X-List-Received-Date: Wed, 23 Jan 2019 12:17:55 -0000
Content-Type: text/plain; charset="UTF-8"

example of the new format:

############################################################
# Build Configuration
                       #
############################################################
DISTRO="esw-space-controller"
DISTRO_VERSION="2.6"
TARGET_SYS="arm-poky-linux-musleabi"
MACHINE="bumblebee-cl-imx7"

############################################################
# Layer Revisions
                       #
############################################################
BBLAYERS_meta:HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
BBLAYERS_meta-poky:HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
BBLAYERS_meta-freescale:HEAD:15a354ee592866a61a893562760ef84bf8fe5e4d:"
BBLAYERS_meta-ti:master:fb8bfa61d74e49d1a436612b07bdb69c1bdd350f:"
BBLAYERS_meta-jci-bsp-bumblebee:HEAD:1e293e40a21840fb42abb6d188d23867afb5e9b2:"
BBLAYERS_meta-oe:HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-networking:HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-python:HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-webserver:HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-swupd:HEAD:ed8911cc40b5164af0715f471ee204ea9a3d3491:"
BBLAYERS_meta-tpm:HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
BBLAYERS_meta-security:HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
BBLAYERS_meta-perl:HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-gplv2:HEAD:aabc30f3bd03f97326fb8596910b94639fea7575:"
BBLAYERS_meta-eclipse-smarthome:HEAD:e91f8808ea1a16f5f03359631c58a782067e7884:"
BBLAYERS_meta-java:HEAD:99d16707d03898fe9fd5b4fee32f6417825a9e6a:"
BBLAYERS_meta-nick:master:3987b1f760a25941168f6c0277a0c49b46f5c723:modified"
BBLAYERS_workspace:<unknown>:<unknown>:modified"

On Wed, 23 Jan 2019 at 12:14, nick83ola <nick83ola@gmail.com> wrote:
>
> this patch permit to simplify extracting build information from
> the /etc/build file from a script, f ex shell or python.
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  meta/classes/image-buildinfo.bbclass | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes/image-buildinfo.bbclass
> b/meta/classes/image-buildinfo.bbclass
> index 94c585d4cd..3ef6ad129d 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -23,7 +23,7 @@ def image_buildinfo_outputvars(vars, d):
>          value = d.getVar(var) or ""
>          if (d.getVarFlag(var, 'type') == "list"):
>              value = oe.utils.squashspaces(value)
> -        ret += "%s = %s\n" % (var, value)
> +        ret += '%s="%s"\n' % (var, value)
>      return ret.rstrip('\n')
>
>  # Gets git branch's status (clean or dirty)
> @@ -40,12 +40,12 @@ def get_layer_git_status(path):
>          # Silently treat errors as "modified", without checking for the
>          # (expected) return code 1 in a modified git repo. For example, we get
>          # output and a 129 return code when a layer isn't a git repo at all.
> -        return "-- modified"
> +        return "modified"
>
>  # Returns layer revisions along with their respective status
>  def get_layer_revs(d):
>      layers = (d.getVar("BBLAYERS") or "").split()
> -    medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
> +    medadata_revs = ['BBLAYERS_%s="%s:%s:%s"' % (os.path.basename(i), \
>          base_get_metadata_git_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None), \
>          get_layer_git_status(i)) \
> @@ -66,19 +66,16 @@ python buildinfo () {
>          return
>      with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'),
> 'w') as build:
>          build.writelines((
> -            '''-----------------------
> -Build Configuration:  |
> ------------------------
> -''',
> +            '############################################################\n',
> +            '# Build Configuration                                      #\n',
> +            '############################################################\n',
>              buildinfo_target(d),
> -            '''
> ------------------------
> -Layer Revisions:      |
> ------------------------
> -''',
> +            '\n\n',
> +            '############################################################\n',
> +            '# Layer Revisions                                          #\n',
> +            '############################################################\n',
>              get_layer_revs(d),
> -            '''
> -'''
> +            '\n',
>         ))
>  }
>
> --
> 2.19.1

