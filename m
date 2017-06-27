Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id A02B16079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:53:48 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id z62so12678186ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 23:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Hani5ZarQwrsfqgOpV+OXi+kAy+iT5xaSB1lCygVxcQ=;
	b=HUp1hFcFkphztwWoMB/l+dbhV+FNeRA1EsmemMS4esAA5/plgTmSDK5k+8VIJNe1dL
	tIrpqSNxcBmVczZ78qI4/B15SCcabX/jY+eJFxQbYKDxqAw+zTXV4xwKm5JSQrlL0oCw
	VoMaI1tgeV7v6n92n004JBApwNMWV/lxxzuqsDX3ET8MlP2hA9qR5m++ftSbZzw6m3he
	rhkciAK48khGza9CgImRjwbhiqRffTzB0uWX9GnjULeFm47ZNDvBPq1pz3LgmEJpfQT0
	lQ14WmOfegPtcnEkwKpqbCprnGXv7VN+B4vSrFNpen70UmJlmsmxIVufd+/Vw16749qq
	3dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Hani5ZarQwrsfqgOpV+OXi+kAy+iT5xaSB1lCygVxcQ=;
	b=JCAy5KQx6NDqx49OhgwibeYLi6cx8k0HLtev/oPqSewfDyg4bE2cwjG66nkrA+5Nff
	jAlaQWs9AF7UZBzHdjca7zIFKHCg9nWYHGBdWk38TXGsdfWIlKXjQP5Ns1gldWHe19kp
	VvcxS2jJFh07cOPwH49vvolMgrqscGtdi7/Uilx8HTFHCTmykmXaPEt5TApxNf3UsbKW
	pARFUzVGeR/Tr8hny93m5t7XaewATrtmtOXUhtpXXbBJ5FjXFaQXZ11SHFsdS/DkPzeo
	qJ8+3KCjYMcreomb9yaAO1suA/2VNl7eLRM28elbR+9KKizOcxN8kWq7gFMo9iwybyJV
	nYWQ==
X-Gm-Message-State: AKS2vOzWbb+mUwEPB2Ql2UFHMEpiY02e7oLAa0oE9RbgorFwJYg5R69r
	M4qbOmRQEamnbN88
X-Received: by 10.107.174.161 with SMTP id n33mr5504567ioo.54.1498546429606;
	Mon, 26 Jun 2017 23:53:49 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id e72sm994999itd.29.2017.06.26.23.53.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 23:53:48 -0700 (PDT)
Message-ID: <1498546425.7464.16.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 27 Jun 2017 08:53:45 +0200
In-Reply-To: <20170626204241.16149-1-anibal.limon@linux.intel.com>
References: <20170626204241.16149-1-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] oeqa/selftest/{context, case}: Add signal handlers SIG{INT, TERM}
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
X-List-Received-Date: Tue, 27 Jun 2017 06:53:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-26 at 15:42 -0500, Aníbal Limón wrote:
>      def run(self, logger, args):
>          self._process_args(logger, args)
> +
> +        signal.signal(signal.SIGTERM, self._signal_clean_handler)
> +        signal.signal(signal.SIGINT, self._signal_clean_handler)
> +
>          rc = None
>  
>          if args.machine:
> @@ -220,6 +264,8 @@ class
> OESelftestTestContextExecutor(OETestContextExecutor):
>              os.remove(output_link)
>          os.symlink(args.output_log, output_link)
>  
> +        self._signal_clean_handler(None, None)
> +

Can't you achieve the same thing with less code by using a
   try:
      ... modify configuration ...
      ... run tests ...
   finally:
      ... clean up ...
block in run()?

Then you are also guaranteed to clean up if an unexpected exception
triggers the aborting of run().

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




