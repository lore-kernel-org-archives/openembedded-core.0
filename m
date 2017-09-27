Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF0777E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:05:24 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v5so7882692pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=u129OAGGQVkQfccGpxWH2fI9L1CDhofelFczivA47+I=;
	b=InasvIxC0vMkSXEUHhMiNgqP946axWewhOZKayEQ6eMVTb94d6WgTqrwjr1tdouTZB
	vPdCX0uZ4Lzv8lRAasunpAgX+A4rgIRmDQeZLvqu2t6e2BasARgndsu0QrrwlxZwjUmt
	YxWJC7mEpn9uFnTCtEiCnIA7iIG5Wpa/6lY4CZZKNQb6f99ayXvybxaMj8V9C03zqIVu
	ActrPTWo0x0FMJt8QmDlx6S2CuFJiT65IQui1LWhJQ7naso6PFkExrTHBr7ZN0aHNCVA
	OycaMePu+DQz1o3/vWijmfvN8/34WLcRo15/OmcLKNeTHX90V4Sjc/NWS6M2U8J2VVN3
	d2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=u129OAGGQVkQfccGpxWH2fI9L1CDhofelFczivA47+I=;
	b=anvWgJO97GLIBGU+Bqzs9WPxJfntRhrEOqlC6tX65MbP6N546OIHPoo6fT/ptJL3PS
	WQDF82DNpefeyNfGpnyejeQpGFHxb/AWU8a4EhvHSGhAhqN/XnbfPmXf2KWxqvQExTBh
	NGO850V3oJF10NFa/aI/dL8lHAb09Xwzuh/ZjXgmvlQBFs/oELF2mFw1Qj5ZB9yEssVU
	mFSxQPcbzGyhPh5TCkstrXbGajIZuxCdkfz/C8pbxVFgT88p9yXYp76NfkDDCZFFN5ny
	RAyaC1P01fVD4adjZTWlS3i67wXd/DOovmeHz8pl6fpNIoJNAJU4HwsEIyLU+7Elyrtr
	xclA==
X-Gm-Message-State: AHPjjUgb3B2SvERwlKTB+npadeCIJoC9EnTA38iPOrXbUYOVH6wQ2tLK
	0+1fkmAogG8gOaR+TzCltJAIWA==
X-Google-Smtp-Source: AOwi7QBZkO0yD1GhZxz71AXdZfgNes7RBVgQghy/wOKCaccyLFS8ltFw1kRe0OEe/Nb28VNShyPR1g==
X-Received: by 10.84.238.205 with SMTP id l13mr12363134pln.173.1506481525807; 
	Tue, 26 Sep 2017 20:05:25 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f084:ad3:5bb0:9acb?
	([2601:202:4001:9ea0:f084:ad3:5bb0:9acb])
	by smtp.gmail.com with ESMTPSA id z8sm6170452pgs.41.2017.09.26.20.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 20:05:25 -0700 (PDT)
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20170926200429.6248-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f1745217-a9ad-677f-1b37-ccafe108c066@gmail.com>
Date: Tue, 26 Sep 2017 20:05:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926200429.6248-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [pyro][PATCH 1/2] selftest/cases/signing: ignore removal errors when cleaning temporary gpg directory
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
X-List-Received-Date: Wed, 27 Sep 2017 03:05:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Leo,


On 09/26/2017 01:04 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> The high-level method tempfile.TemporaryDirectory give us no way to
> ignore erros on removal thus use tempfile.mkdtemp instead. Ignoring possible issues
> on removal is neccesary because it contains gpg sockets that are automatically removed
> by the system once the process terminates, otherwise the following log is observed:
>
>   ..
>   ..
>   File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
>     os.unlink(name, dir_fd=topfd)
>   FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.browser'
>
> [YOCTO #11821]
merged to stagging,
Thanks,
Armin
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/signing.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
> index 0ac3d1fac9..38e29305d5 100644
> --- a/meta/lib/oeqa/selftest/signing.py
> +++ b/meta/lib/oeqa/selftest/signing.py
> @@ -21,14 +21,17 @@ class Signing(oeSelfTest):
>          if not shutil.which("gpg"):
>              raise AssertionError("This test needs GnuPG")
>  
> -        cls.gpg_home_dir = tempfile.TemporaryDirectory(prefix="oeqa-signing-")
> -        cls.gpg_dir = cls.gpg_home_dir.name
> +        cls.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
>  
>          cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
>          cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
>  
>          runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
>  
> +    @classmethod
> +    def tearDownClass(cls):
> +        shutil.rmtree(cls.gpg_dir, ignore_errors=True)
> +
>      @testcase(1362)
>      def test_signing_packages(self):
>          """


