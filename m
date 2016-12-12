Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 33FE071A21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 08:05:43 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id a81so150644185ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 00:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Gci2uEYOLghNssxxfqHYYl9P0iO9qZmsEuLX8m0MkJ4=;
	b=q4DOIWQxPAYsefBrviLwIiIDggHjYoNBpNSVMD12ckCz0iCSt7g3CYqzi2f9RwpQnn
	HmqhyPzJ0tuUON34p/aBK19+TXWYejopa2LepcvixaM52SQvY9HbDOlh+Wg9F16SnoBV
	GvZQdJuhELywV1dZitKEUEKbnGFjhIPazghNDtUmSgGCQ4A+ub5YMy1khc9C2u9hQ3Ws
	UegLEstf6DS6zAvEF25GJmU82y7U48cqHH/nMeygXCXuxSwNIDtnjjuvXRCPnTH31gf7
	/8JoGei2t5jVZkwCLwSrVQTYSMbzNDNX47D63ujELpskejYE5+Ntd9qqucS09y7ZXHmP
	RzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Gci2uEYOLghNssxxfqHYYl9P0iO9qZmsEuLX8m0MkJ4=;
	b=NQ3VTMUlhm7hb1wfmTJFRF1ZARK42fRwJCeSTFE1ZIOvNyDBpM5+ESeDWxn5B+mlPP
	LeVwbnTY1tg2RBvWk4ObCL4ydS9fBas4l3tCQGxbImpGhLRW6sOOuvTTvXsHuTLDge36
	Xfkzq/w98DBG/2QBj5hvdOUitM76fzvNbBT8+XbO+4n9u2AApCUMnsepnycwwHHTwyVe
	7USTx7VRVo4dWmMbMsEUqGJ9nKfz7z3EiJLmnmZWnLEbkDCL6Q/XpUf18T07ncstaNJp
	PfdxsLrkWSl38wOl5R4/3uYafSTNqW0Vg7rmrTriD/kC4I7ULJfjQNomhZlXZnW4yN9G
	JmPw==
X-Gm-Message-State: AKaTC01L5bRKKBP6E982sA4ZvTBVjIoDfvYPIZRKy0b0qqBGEofULwvRTHFOPhTdAYpoywfw
X-Received: by 10.107.163.19 with SMTP id m19mr26321185ioe.222.1481529945312; 
	Mon, 12 Dec 2016 00:05:45 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E6D1.dip0.t-ipconnect.de. [93.232.230.209])
	by smtp.gmail.com with ESMTPSA id
	q82sm11485157itd.10.2016.12.12.00.05.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 00:05:44 -0800 (PST)
Message-ID: <1481529942.17535.198.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Mon, 12 Dec 2016 09:05:42 +0100
In-Reply-To: <4d5b1453815a0fe2389ced2a0a152249b3a97e62.1479809328.git.Qi.Chen@windriver.com>
References: <cover.1479809328.git.Qi.Chen@windriver.com>
	<4d5b1453815a0fe2389ced2a0a152249b3a97e62.1479809328.git.Qi.Chen@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] initscripts: support persistent /var/log
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
X-List-Received-Date: Mon, 12 Dec 2016 08:05:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-11-22 at 18:10 +0800, Chen Qi wrote:
> ${WORKDIR}/volatiles         ${D}${sysconfdir}/default/volatiles/00_core
> +       if [ "${VOLATILE_LOG_DIR}" = "log" ]; then
> +               echo "l root root 0755 /var/log /var/volatile/log" >>
> ${D}${sysconfdir}/default/volatiles/00_core
> +       fi

Why are you checking for "log" here? I thought VOLATILE_LOG_DIR was
supposed to be a boolean?

Using oe.types.boolean in shell code is a bit awkward, but would be
necessary for the sake of consistency when allowing VOLATILE_LOG_DIR to
have more than just yes/no. Untested (relies on bool->str conversion):

if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




