Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id D6E827BFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 20:16:58 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id c19-v6so3484465lja.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 12:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jnV5w1yUEOuoWaQet7Q+na8UGpy+YrskLKyV3sHvYD0=;
	b=qT4OzVhbeTNKUYgkEXhQHeaUKYqHqwYebfKLNDc/2Wd6++FFfXjjLr6DF1y6v3rN0p
	gHlQsOCmAJCRWgC1SiRWKnObCZfkk0LMNxuYTq2vZyhzezSdQyInCIuC5TwjJeZYkiNn
	YS1/Bd5C7QsboPKc8FXrCctajL7ZR/IWo9lxlo4C9MkXNK/vlOzTwWQz0zFCHQ8lfUAT
	3mNuzm3jtGKNL00LgsbLPrraZxqogPR+6q4VCVcggYUWAsiv1wB9G5iwUU4uXX63Mdh8
	tKgqpNqNDZI4UVKb9ROMSB/z54/z/ZTtARrb/kuLAyJRF80peGwATDHhdwX5yO0ugQSA
	Y+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jnV5w1yUEOuoWaQet7Q+na8UGpy+YrskLKyV3sHvYD0=;
	b=Z8mRLhY19JiSqdDifh9pG8xdXjIAPqLTWbj7EutRbIksu3IBuYIbS/3C9xF+hx3ZOz
	PI9p39F4b3fco7sDak6AEmv4bR3AcwZNlskoiFuxv3sGc1rvp3YBFDgHCmE9x117miwb
	412ao2plURdwiWAstC4LqZgzo9aZCdmgS0hu/KUw3qZUWB8GJCiXrjGqdvaHNAEoRuHT
	bqUT8lLdqUuguZh3pzd1hFlPAHEzWDFSrzByndJUjSuHP6qg7KYVjGCkv0Vjn631crEb
	TyEkXbtK4ZHgb/cIGH26EdZ+PbORAeOQFWlQUXLgX/+sgR2ovGK3zeBllKVlVmsp5ocK
	hyCQ==
X-Gm-Message-State: AJcUukcfqFyT7E+DrOQq710B3Ic+3Ala94tJHfvOm0CLYiWviCTe5Y+P
	L/4btS4pyGZRobc753vP3DY=
X-Google-Smtp-Source: ALg8bN7jcunA+zpVhR2ldjLI6e/e+w4Xt+rrzZIw8/rAMVnfvJrWSlTYJ6J2+QdG6sgTEoq3D0KdaQ==
X-Received: by 2002:a2e:880a:: with SMTP id
	x10-v6mr4243390ljh.174.1547583419283; 
	Tue, 15 Jan 2019 12:16:59 -0800 (PST)
Received: from [192.168.10.106] (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	f16-v6sm731804lji.88.2019.01.15.12.16.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 12:16:58 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190115193950.25538-1-JPEWhacker@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <272c34a9-5806-eafa-7d2a-b44ef25d63cf@gmail.com>
Date: Tue, 15 Jan 2019 21:16:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190115193950.25538-1-JPEWhacker@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH] classes/sstate: Update output hash
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
X-List-Received-Date: Tue, 15 Jan 2019 20:16:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/15/19 8:39 PM, Joshua Watt wrote:
> Updates the output hash calculation for determining if tasks are
> equivalent. The new algorithm does the following based on feedback:
>   1) All files are printed in a single line tabular format
>   2) Prints the file type and mode in a user-friendly ls-like format
>   3) Includes the file owner and group (by name, not ID). These are only
>      included if the task is run under pseudo, since that is the only
>      time they can be consistently determined.
>   4) File size is included for regular files
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/sstate.bbclass | 91 +++++++++++++++++++++++++++++++------
>   1 file changed, 76 insertions(+), 15 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 482ffa83f98..a103a759825 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -784,6 +784,8 @@ python sstate_sign_package () {
>   def OEOuthashBasic(path, sigfile, task, d):
>       import hashlib
>       import stat
> +    import pwd
> +    import grp
>   
>       def update_hash(s):
>           s = s.encode('utf-8')
> @@ -793,6 +795,7 @@ def OEOuthashBasic(path, sigfile, task, d):
>   
>       h = hashlib.sha256()
>       prev_dir = os.getcwd()
> +    include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
>   
>       try:
>           os.chdir(path)
> @@ -807,34 +810,92 @@ def OEOuthashBasic(path, sigfile, task, d):
>           update_hash("task=%s\n" % task)
>   
>           for root, dirs, files in os.walk('.', topdown=True):
> -            # Sort directories and files to ensure consistent ordering
> +            # Sort directories to ensure consistent ordering when recursing
>               dirs.sort()
>               files.sort()
>   
> -            for f in files:
> -                path = os.path.join(root, f)
> +            def process(path):
>                   s = os.lstat(path)
>   
> -                # Hash file path
> -                update_hash(path + '\n')
> +                if stat.S_ISDIR(s.st_mode):
> +                    update_hash('d')
> +                elif stat.S_ISCHR(s.st_mode):
> +                    update_hash('c')
> +                elif stat.S_ISBLK(s.st_mode):
> +                    update_hash('b')
> +                elif stat.S_ISSOCK(s.st_mode):
> +                    update_hash('s')
> +                elif stat.S_ISLNK(s.st_mode):
> +                    update_hash('l')
> +                elif stat.S_ISFIFO(s.st_mode):
> +                    update_hash('p')
> +                else:
> +                    update_hash('-')
> +
> +                def add_perm(mask, on, off='-'):
> +                    if mask & s.st_mode:
> +                        update_hash(on)
> +                    else:
> +                        update_hash(off)
> +
> +                add_perm(stat.S_IRUSR, 'r')
> +                add_perm(stat.S_IWUSR, 'w')
> +                if stat.S_ISUID & s.st_mode:
> +                    add_perm(stat.S_IXUSR, 's', 'S')
> +                else:
> +                    add_perm(stat.S_IXUSR, 'x')
>   
> -                # Hash file mode
> -                update_hash("\tmode=0x%x\n" % stat.S_IMODE(s.st_mode))
> -                update_hash("\ttype=0x%x\n" % stat.S_IFMT(s.st_mode))
> +                add_perm(stat.S_IRGRP, 'r')
> +                add_perm(stat.S_IWGRP, 'w')
> +                if stat.S_ISGID & s.st_mode:
> +                    add_perm(stat.S_IXGRP, 's', 'S')
> +                else:
> +                    add_perm(stat.S_IXGRP, 'x')
>   
> -                if stat.S_ISBLK(s.st_mode) or stat.S_ISBLK(s.st_mode):
> -                    # Hash device major and minor
> -                    update_hash("\tdev=%d,%d\n" % (os.major(s.st_rdev), os.minor(s.st_rdev)))
> -                elif stat.S_ISLNK(s.st_mode):
> -                    # Hash symbolic link
> -                    update_hash("\tsymlink=%s\n" % os.readlink(path))
> +                add_perm(stat.S_IROTH, 'r')
> +                add_perm(stat.S_IWOTH, 'w')
> +                if stat.S_ISVTX & s.st_mode:
> +                    update_hash('t')
> +                else:
> +                    add_perm(stat.S_IXOTH, 'x')
> +
> +                if include_owners:
> +                    #update_hash(" %5d" % s.st_uid)
> +                    #update_hash(" %5d" % s.st_gid)
> +                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
> +                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
> +
> +                if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
> +                    update_hash(" %9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
>                   else:
> +                    update_hash(" " * 10)
> +
> +                if stat.S_ISREG(s.st_mode):
> +                    update_hash(" %10d" % s.st_size)
> +                else:
> +                    update_hash(" " * 11)
> +
> +                update_hash(" %s" % path)
> +
> +                if stat.S_ISLNK(s.st_mode):
> +                    update_hash(" -> %s" % os.readlink(path))
> +
> +                if stat.S_ISREG(s.st_mode):
>                       fh = hashlib.sha256()
>                       # Hash file contents
>                       with open(path, 'rb') as d:
>                           for chunk in iter(lambda: d.read(4096), b""):
>                               fh.update(chunk)
> -                    update_hash("\tdigest=%s\n" % fh.hexdigest())
> +                    update_hash(" %s" % fh.hexdigest())
> +
> +                update_hash("\n")
> +
> +            # Process this directory and all its child files
> +            process(root)
> +            for f in files:
> +                if f == 'fixmepath':
> +                    continue
> +                process(os.path.join(root, f))
>       finally:
>           os.chdir(prev_dir)
>   
> 

Thanks for working on this Joshua.

It looks really nice, this is an example of the busybox depsig.do_package I get with this patch applied:

drwxrwxr-x       root       root                      .
drwxr-xr-x       root       root                      ./package
drwxr-xr-x       root       root                      ./package/bin
lrwxrwxrwx       root       root                      ./package/bin/busybox -> busybox.nosuid
-rwxr-xr-x       root       root               551388 ./package/bin/busybox.nosuid b50144c6a810bf92cbd442fd6f55794b6cdc8625a46f55c2e9d86ad22d75134a
-rwsr-xr-x       root       root                50860 ./package/bin/busybox.suid eb7af7e8f9e4a5bf6be7fb5ac16064ccd8f35e9890661134c5d73efbeb6e1d44
lrwxrwxrwx       root       root                      ./package/bin/sh -> busybox.nosuid

How about prepending the hashes first, printing just spaces or maybe doing '000...' for symlinks and directories ?

My 2 cents..
/Jacob

