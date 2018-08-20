Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id C44E279000
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 16:19:05 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id 13-v6so26806102ois.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WhhijPkBaGO8MhgpYw/TYCveiU5hnXXZ35YnT8OyNnM=;
	b=b58fIXbUep1MxznKZbkqxR6XMLVVSqQuDac4G3GxuszrjLiCB2C2KcNlR4IWR7Do/G
	kxSaCLGaxqH/sm3xyEF4dUAWxjX/h/VeJ4PM3Qn0ZHKWIwxXRs+bVtjBy5eNdd6+EgkD
	IgygWdOya5rXtwtJeQSXxuP9N5Ffyz+imCEjVe7h1ROZYUG/zOOvDMcwKiT/wycl3OIR
	po0LTBfLP7SIQ1g7Gu2F/ilhksi5bXBVwFJEA3Rzg5s7S4jnSnVkC0Wy/+NzOQQYmiFy
	ODih+MHeMnNkIDa9SQNLvhz+PCC2r3vASdG40tsJmrP2retD6h6ALPSwnghr+ytNzklU
	zjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WhhijPkBaGO8MhgpYw/TYCveiU5hnXXZ35YnT8OyNnM=;
	b=cvqy9EFx4XSKbwSx+eRT+lsrdcqUFsNqeF9ezgE8j9cLwjQl6bTNWrroq1urfO/pLu
	gX5wfWhs79CPQFHRq2pgnU00Mb16aSXRGIErqxPV8gtWxdZn5pY2LaG1JQvZc1eIgbwS
	jjWGETLnrnE9NURzwea4alNtAoXs6rGI4U7psiiCq8i28oK/R36KFe66sKy8Oemq8cpy
	iNBzFO3QkQYgosya41KlMz7gDKi+c9l8x9jvqzE7Bf9++a6MHwhbaTFU82u9OuzDcgEe
	2vpDiQgXp+m3ewWZT/NZypJIf74gHBAB6MYADMw/qaTgPDbOViy/Dd7TPn4V+VvU0FtB
	vbHQ==
X-Gm-Message-State: AOUpUlFZTW2twXwD3qOrHhUIB7HMDVKKE/KfivR8bKFtXGx9Om0jUG9m
	wTU/w9i1L2J02IAUFieVLnha/ZKs5Bhz+Ybp5djtO1FFLtg=
X-Google-Smtp-Source: AA+uWPwF4PcoAZ90zkaSm+NFNr3juZec+wlS5WilN509qRHdQF4oEw23/W5AmhLgnru514TAqkm+4zH/cHRYi6ZBSgI=
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr13476008oib.217.1534781946671; 
	Mon, 20 Aug 2018 09:19:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 09:19:06
	-0700 (PDT)
In-Reply-To: <lysh39rpwx.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9NvALbQks02PS_Q-9cc=ZACfxWX8O3FKDC1-aP1p964A@mail.gmail.com>
	<lysh39rpwx.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Aug 2018 18:19:06 +0200
Message-ID: <CANNYZj9Ac=riDSLr1wANmKzNe-DoP5jd-YUVrM2-Us+1ci=zkA@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Submission of 'emit-buildvars' class?
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
X-List-Received-Date: Mon, 20 Aug 2018 16:19:05 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-20 17:58 GMT+02:00 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>:
> I do not know, how this can be done with plain OE.  As said, SDKs are too
> heavy weighted, 'devshell' too slow and can not be scripted, 'externalsrc'
> is broken, slow and can not be scripted.

For better or worse, Yocto Project has standardized on devtool (not
devshell!) and externalsrc for these kind of local development
workflows. You are very welcome to improve and add to them, so they
are not broken or slow, but a wholly different mechanism is not likely
to be accepted.

Alex

