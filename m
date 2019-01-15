Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 42FFD7BDB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 20:49:24 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u18so3113759lff.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lzoQbxIBwHxRLtp2P5tebWymhramUFZ3GKCZPh4Voys=;
	b=fLUqRimGb8iWHBCeKkNrE2BDzJUUEycytC32Qa3rA52m5W1ulErKKGp5TVnMC+pi/N
	pi9bmqnkgKrsa3EWD/KEU+Y/CLQseD7CXmAhClmmvIc7VLf5xqjmYILWbfcCoCj7SWaX
	sduu4lAE2TxkkTfNwY5f4ysQj37UmnrUDwEl5OIcJ2VrBUWt8QVtyYrZdtAeYfRjhd3k
	YwsSl4S5PF3+2igB8M5Zqi75fl9b8IWChI/UBZrPb30qhJVm/HMfqagWPlHI1PdRLdjh
	Xbh3q3L6Gj6tYCK64D04JJTZYiNaos/wL1sHfwZhFVcMejZI2bdRlAgn06LHi4i0iiSv
	iwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lzoQbxIBwHxRLtp2P5tebWymhramUFZ3GKCZPh4Voys=;
	b=PxfJGKTczxLiank8CTaOAt9pQGy4XMVAwDBYQuWnddbSpv02A9X0lwEsb+0xbnOKpS
	Ps1kMxjfrd/TkHuMLep29oqF3aakWqLW2ib2KBNTYsM6Y3JLNsswz/b4KAd39gbw4kMY
	NlOpEw5tGRaupPAEYNmBQMFUk24uuNx5QVkuHe5UuiJ8v6gXggiR/hX3CnWABFtByfpb
	KU5EjDpdbEWSshYhDnjDQMxoZcGq/6kP46+103B7SqiO2tBU1Kx32IT8cTJLkeiPo33k
	sBlrjWFONJA5joKo7BFYOj3Bq60mBbzDaL1JQR5+T4EtkeUsLrj9afe0R3nDvmaw4Y9z
	gfzg==
X-Gm-Message-State: AJcUukfmN8ubLHfAMXID6nJR5xKNeRvj75McgenpsLiaCq7Q8Ww1D5DU
	ZvPNQ30Snt8qsNUqycw66uM=
X-Google-Smtp-Source: ALg8bN72n8iNUiZ0lC0pMSnSIydSWOGhw7A6+aK1V4BNyVKDXWKKwCAuc3i/GQ3dRQbG8sNms0glow==
X-Received: by 2002:a19:750a:: with SMTP id y10mr4166639lfe.43.1547585364565; 
	Tue, 15 Jan 2019 12:49:24 -0800 (PST)
Received: from [192.168.10.106] (37-247-29-68.customers.ownit.se.
	[37.247.29.68])
	by smtp.gmail.com with ESMTPSA id h82sm813456lfg.94.2019.01.15.12.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 12:49:23 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190115193950.25538-1-JPEWhacker@gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <50e05f13-24e7-f876-4664-363a85e9f5e5@gmail.com>
Date: Tue, 15 Jan 2019 21:49:22 +0100
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
X-List-Received-Date: Tue, 15 Jan 2019 20:49:24 -0000
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

left-overs from development ?

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

