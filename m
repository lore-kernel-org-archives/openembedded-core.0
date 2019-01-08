Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DD6167BE8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 12:44:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j2so3942589wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ozMNAXsUrowU2PMd0OVhvS4AiQ35NiI0OdN+E/n2ztg=;
	b=GKhj54vw7ojlcDJsRJukkqbjgGLCGqgDGw4YI+ZgIqRKYVDUzW2fIhxI3MqLgRVBju
	8az9THvERUd57sCm9oUhDjIasD/97rK9No0RNB+TGSM/LyfVB9P7eLCw7jQde7PmaMrt
	6Xq9cjQQA1yVo0T7IsIHn5UWqtO9p5Pe8/XCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ozMNAXsUrowU2PMd0OVhvS4AiQ35NiI0OdN+E/n2ztg=;
	b=jZXG2OmpQC2ERYBNeOaMBcpFbutCUqtiXx2M5BdmEHGt1EjncQHwsnbJFgxk5QeI8t
	2iB42Fo9TUdQW4C9K4WR5i2E3J8rcFsZAe0mpEFnwwdGnkciY4WZavBNUXSH90RGS9c0
	/9jJe1DD0w7MttWTd+VJe6ha24PZXqV0SVcX7Vynvdogw7InEpdPArbk7yl7cPXjbFBi
	eySpijGdAdiEccI2ZDfT1mLfvVbdX/NJpO4aiXThoW4YoClb56sslA8dGBHGOHqjO03I
	1jLCHms6dG1pAEPaCr4L/aklauqlwEiMU1rmQsuBMDimEuCd45garEhyn4JCskik2845
	BcWg==
X-Gm-Message-State: AJcUukeZy0NMkIBPx80kEQBJasYStsCS/Kwvp3cQO8btXwwFV1Lpy/2i
	PamkZuRAktypy6SGgdaFzjEZAw==
X-Google-Smtp-Source: ALg8bN5m9xnUabHiOnyEqvPbX2zobCG/CwQYk4QIoXhkwlwnETMQn5i6NNvX/lFtUv4cYMgmxWAaKA==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr1466557wrp.59.1546951493471; 
	Tue, 08 Jan 2019 04:44:53 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y13sm44025025wrn.73.2019.01.08.04.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Jan 2019 04:44:52 -0800 (PST)
Message-ID: <7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Chen Qi <Qi.Chen@windriver.com>
Date: Tue, 08 Jan 2019 12:44:51 +0000
In-Reply-To: <CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
	<CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Tue, 08 Jan 2019 12:44:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-08 at 12:40 +0000, Burton, Ross wrote:
> On Tue, 8 Jan 2019 at 09:06, Chen Qi <Qi.Chen@windriver.com> wrote:
> >         if [ "${hostname}" ]; then
> >                 echo ${hostname} > ${D}${sysconfdir}/hostname
> > +               echo "127.0.1.1 ${hostname}" >>
> > ${D}${sysconfdir}/hosts
> >         fi
> 
> Instead of appending to the file, can you put a marker on the
> 127.0.0.1 line and replace it inline?

Not so good if hostname isn't set?

Cheers,

Richard


