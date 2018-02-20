Return-Path: <leon.anavi@konsulko.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD76578868
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 09:57:31 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id p104so11200887wrc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=to:from:cc:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=Vzo42St0XPz1D5UIjHsxF5srqV4eqHQcTuR61fUIonU=;
	b=ktEk8m3Fu71yqbufL8/+ner2nOic0oAn4tOd9EFD9++Fg68zAPa+pTXTM008dREMrW
	IDEUMBwkJWiP2G7vv0zJb2mOL1c5cMEk9dTsqEuiN+T+GmauN7r0WcDdQNE4TF/H+Ejk
	MPIPwuFmpbe8W5pi+siETIVTnZvj9UueqG/NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=Vzo42St0XPz1D5UIjHsxF5srqV4eqHQcTuR61fUIonU=;
	b=FiMQZiKHPRyi+4nYDkOFzgxgc8wRWObTwlPU5EqyBpiCTcAqyNoNdsqx+IAHWo7Fhw
	uTAqjUVBDckvFn9vW7Azo/86lPuWQsVnPqEo00KJ9cWSf1qQfu7/7uBDQG8bTrxjSE+7
	nR9LPQHd2K3EcvKSUty2ZQB9QFLzgfio3/8V2OZRW16EjH0iseABB9nUMgN62QpyqwtV
	wrN3TZWoRJTUqmWjuzJ9sLwM/jKVCv2PTioMC4YkRoBV5/qNz1nx8T509yAdLF+oVL41
	4YDMbfwyDpxKcteevZqu2J318QpQFgJ5VrJQ0SxAf5PTqF96q5VwsxgcPI464o9EMbFj
	j5Xg==
X-Gm-Message-State: APf1xPBj29ottjnDRXHbYhDJn3R6LayCQV6mKFrnPQ3ry0pG/IY7TlHG
	/NiQLVQ+DUHjWMQ7w5ftVwKrmw==
X-Google-Smtp-Source: AH8x226Ioy19zuLnxS2t3z6mjb5liFy6Nh8+PvGsqfMhZ67y3yqCKOVUDHYrtj7quXqrXIUF9kf8gw==
X-Received: by 10.28.164.196 with SMTP id n187mr5499859wme.141.1519120652453; 
	Tue, 20 Feb 2018 01:57:32 -0800 (PST)
Received: from [192.168.4.209] ([213.145.109.17])
	by smtp.gmail.com with ESMTPSA id
	l15sm24053488wrb.91.2018.02.20.01.57.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 01:57:31 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <5281f708-550c-0c1c-227c-c171b720582c@konsulko.com>
Date: Tue, 20 Feb 2018 11:57:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: Back porting lttng-module update to v2.10.5 from master to rocko
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
X-List-Received-Date: Tue, 20 Feb 2018 09:57:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi,

Yesterday, while working on Automotive Grade Linux (AGL) based on
Yocto/OpenEmbedded layers for release Rocko, I noticed an issue with
lttng-modules for machine intel-corei7-64 with Linux kernel 4.9.77. The
fix requires updating lttng-modules to v2.10.5 and has been already done
at the master branch of openembedded-core (OE-Core rev:
7f00a5161889a422d83dc113521d9241fdd89abf).

Could you please back port this change to branch Rocko?

Thanks,
Leon

--=20
Leon Anavi
Software Engineer
konsulko.com



