Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 73A3C6C3B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 00:13:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d126so127308pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KOjZz9DBsQ/yAxhhXCT4YTPGfUVhLlN5FuzAkj1qQCw=;
	b=nRySoJi25TXYLMpz6TY5wnwi4e+/VR08wjOG81KxHCmbOHBQgUqr38inVkPJZHu+7b
	6CfBhdn0pg+JjVNvmIWkUxBnGL/Nk8Zejb6MCEZFoexPCAOs922Ysy4MU6XFk2Z7j8AC
	HtJF/IUVNZYmGzPBLMibeD7T6M5HiA7iH0ryvp64ItInZijILmMi6D1Z27tOulF7Mqep
	bwQ3r0C/aMprj2aYy+JcUe5Tvcn5AF4SOFErwJez2RFcOyhI/2Wpx7pGHHHCz3ryvE6c
	ZVTuj8zUOecfid4fHsrJxHRki69+namw7kCKsJbMTTcSJyvIYa/i21m3SZzlHJYgkRBt
	beTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=KOjZz9DBsQ/yAxhhXCT4YTPGfUVhLlN5FuzAkj1qQCw=;
	b=n7+BxZ40Ue2KNFC3dpaV/oTBDW+zZ/VDs7JPKitsfRMj0MFhswsGWnPfeIH4b4EO9f
	Oe7biOY1b5P10rPFL1jWgCft3J2fbQB+dDEkn2nrWZhcoj9R2r6pwnh1gsTII9UbYNrS
	0hyYgsbUXNKFXF6xNz50SBiqQGcd0T60xNGONpX+6IglXUJThsExqi4GopvD8F/374Yb
	hgpCZgePl6LeRrGGqAtvJ5TGivSKisKV7dOi9vutjuo5zF9eh5UsHi2Fu9VUQUYw5oG1
	QV8ggw5uCYTEiH1d82cWcromB13/cUqYw6qys0stGkrWdG2iyAfO33Jit6cGO3L56ES0
	VphQ==
X-Gm-Message-State: APjAAAUVHABy9RI5XIIyfGaVBBNvMCZ9g3YBg9p++nHT7PdjapSGtK9W
	xQYLq0P4bDyvwiy11y/uZHLpUHGG
X-Google-Smtp-Source: APXvYqy7DdK7kdaL7wxD33xhW4UmOK4nx8O+dPAncVZeigz3ZbbKK6jObBXsYJBd0HuO7IUeNYt8EQ==
X-Received: by 2002:a17:90a:9202:: with SMTP id
	m2mr2517638pjo.37.1559866386206; 
	Thu, 06 Jun 2019 17:13:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:649f:275:809c:24d6?
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id m6sm203984pjl.18.2019.06.06.17.13.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 17:13:05 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190606221730.19043-1-richard.purdie@linuxfoundation.org>
	<20190606221730.19043-2-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <57c9b8ea-dcf6-5c5c-4a68-8826ba45c26a@gmail.com>
Date: Thu, 6 Jun 2019 17:13:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606221730.19043-2-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/2] gpg_sign/selftest: Fix secmem parameter handling
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
X-List-Received-Date: Fri, 07 Jun 2019 00:13:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/6/19 3:17 PM, Richard Purdie wrote:
> We keep seeing "cannot allocate memory" errors from rpm when signing packages
> on the autobuilder. The following were tried:
>
> * checking locked memory use (isn't hitting limits)
> * Restricting RPM_GPG_SIGN_CHUNK to 1
> * Limiting to 10 parallel do_package_write_rpm tasks
> * Allowing unlimied memory overcommit
> * Disabling rpm parallel compression

Thanks for fixing this.

I thought I broke the stable branches while testing backports.

- Armin
>
> and the test still failed. Further invetigation showed that the --auto-expand-secmem
> wasn't being passed to gpg-agent which meant the secmem couldn't be expanded hence the
> errors when there was pressure on the agent.
>
> The reason this happens is that some of the early gpg commands can start the agent
> without the option and it sticks around in memory so a version with the correct
> option may or may not get started.
>
> We therefore add the option to all the key gpg calls.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/gpg_sign.py                 | 39 ++++++++++++++-----------
>  meta/lib/oeqa/selftest/cases/signing.py |  3 +-
>  2 files changed, 24 insertions(+), 18 deletions(-)
>
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index a95d2ba34c6..2fd8c3b1ac3 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -15,21 +15,27 @@ class LocalSigner(object):
>      def __init__(self, d):
>          self.gpg_bin = d.getVar('GPG_BIN') or \
>                    bb.utils.which(os.getenv('PATH'), 'gpg')
> +        self.gpg_cmd = [self.gpg_bin]
> +        self.gpg_agent_bin = bb.utils.which(os.getenv('PATH'), "gpg-agent")
> +        # Without this we see "Cannot allocate memory" errors when running processes in parallel
> +        # It needs to be set for any gpg command since any agent launched can stick around in memory
> +        # and this parameter must be set.
> +        if self.gpg_agent_bin:
> +            self.gpg_cmd += ["--agent-program=%s|--auto-expand-secmem" % (self.gpg_agent_bin)]
>          self.gpg_path = d.getVar('GPG_PATH')
> -        self.gpg_version = self.get_gpg_version()
>          self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
> -        self.gpg_agent_bin = bb.utils.which(os.getenv('PATH'), "gpg-agent")
> +        self.gpg_version = self.get_gpg_version()
> +
>  
>      def export_pubkey(self, output_file, keyid, armor=True):
>          """Export GPG public key to a file"""
> -        cmd = '%s --no-permission-warning --batch --yes --export -o %s ' % \
> -                (self.gpg_bin, output_file)
> +        cmd = self.gpg_cmd + ["--no-permission-warning", "--batch", "--yes", "--export", "-o", output_file]
>          if self.gpg_path:
> -            cmd += "--homedir %s " % self.gpg_path
> +            cmd += ["--homedir", self.gpg_path]
>          if armor:
> -            cmd += "--armor "
> -        cmd += keyid
> -        subprocess.check_output(shlex.split(cmd), stderr=subprocess.STDOUT)
> +            cmd += ["--armor"]
> +        cmd += [keyid]
> +        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
>  
>      def sign_rpms(self, files, keyid, passphrase, digest, sign_chunk, fsk=None, fsk_password=None):
>          """Sign RPM files"""
> @@ -59,7 +65,7 @@ class LocalSigner(object):
>          if passphrase_file and passphrase:
>              raise Exception("You should use either passphrase_file of passphrase, not both")
>  
> -        cmd = [self.gpg_bin, '--detach-sign', '--no-permission-warning', '--batch',
> +        cmd = self.gpg_cmd + ['--detach-sign', '--no-permission-warning', '--batch',
>                 '--no-tty', '--yes', '--passphrase-fd', '0', '-u', keyid]
>  
>          if self.gpg_path:
> @@ -72,9 +78,6 @@ class LocalSigner(object):
>          if self.gpg_version > (2,1,):
>              cmd += ['--pinentry-mode', 'loopback']
>  
> -        if self.gpg_agent_bin:
> -            cmd += ["--agent-program=%s|--auto-expand-secmem" % (self.gpg_agent_bin)]
> -
>          cmd += [input_file]
>  
>          try:
> @@ -101,7 +104,8 @@ class LocalSigner(object):
>      def get_gpg_version(self):
>          """Return the gpg version as a tuple of ints"""
>          try:
> -            ver_str = subprocess.check_output((self.gpg_bin, "--version", "--no-permission-warning")).split()[2].decode("utf-8")
> +            cmd = self.gpg_cmd + ["--version", "--no-permission-warning"]
> +            ver_str = subprocess.check_output(cmd).split()[2].decode("utf-8")
>              return tuple([int(i) for i in ver_str.split("-")[0].split('.')])
>          except subprocess.CalledProcessError as e:
>              raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
> @@ -109,11 +113,12 @@ class LocalSigner(object):
>  
>      def verify(self, sig_file):
>          """Verify signature"""
> -        cmd = self.gpg_bin + " --verify --no-permission-warning "
> +        cmd = self.gpg_cmd + [" --verify", "--no-permission-warning"]
>          if self.gpg_path:
> -            cmd += "--homedir %s " % self.gpg_path
> -        cmd += sig_file
> -        status = subprocess.call(shlex.split(cmd))
> +            cmd += ["--homedir", self.gpg_path]
> +
> +        cmd += [sig_file]
> +        status = subprocess.call(cmd)
>          ret = False if status else True
>          return ret
>  
> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
> index 4ef2f70075e..404d68b899b 100644
> --- a/meta/lib/oeqa/selftest/cases/signing.py
> +++ b/meta/lib/oeqa/selftest/cases/signing.py
> @@ -30,7 +30,8 @@ class Signing(OESelftestTestCase):
>          self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
>  
>          nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
> -        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
> +
> +        runCmd('gpg --agent-program=`which gpg-agent`\|--auto-expand-secmem --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
>          return nsysroot + get_bb_var("bindir_native")
>  
>  


