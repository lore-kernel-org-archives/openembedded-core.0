Return-Path: <andrea.dichiara79@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id A85496AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 16:56:29 +0000 (UTC)
Received: by wief7 with SMTP id f7so106099162wie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=nnAyE3SKR4qQPffbkJTInToCEgkdRJklxjrxeWeiTRA=;
	b=yfDXPUFVh0IKiYKskt0q9mgUj7HE6uiiDppEPHF4LfRTE45ckgrYiJT3zCGsBM5tKr
	pCWA6gvN7dxadnD3cRUxvjGR+4JJEkaRHNjKK71sxP1IH67EkldC6z4ZcBurl44ELNlp
	JA/9a/6QNhECw3u/tY9EpXJOmWJeecToTSdBcjR10XgS40F7a3Xd8I0fpOdZBhgbJdFK
	8Z3Xqo8d1SEJZThjGI+T/3li6UFl1skKknHNkmuPZZMyGLxl68YANfz2bx7os1A5lGJi
	Tl3TiRXYkjUR8CJNeegkbisU+XZaE0jRM+I3oYC6XIaXxutlGUyHwjJ9Wc7772kbEHVQ
	c8VA==
X-Received: by 10.194.237.34 with SMTP id uz2mr52273959wjc.157.1430844990087; 
	Tue, 05 May 2015 09:56:30 -0700 (PDT)
Received: from [192.168.1.101]
	(host115-101-dynamic.252-95-r.retail.telecomitalia.it.
	[95.252.101.115]) by mx.google.com with ESMTPSA id
	gs7sm17031871wib.10.2015.05.05.09.56.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 09:56:29 -0700 (PDT)
Message-ID: <5548F63F.6090800@gmail.com>
Date: Tue, 05 May 2015 18:56:31 +0200
From: Andrea Di Chiara <andrea.dichiara79@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: upstart init manager
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
X-List-Received-Date: Tue, 05 May 2015 16:56:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,
I'm building my own distribution using Yocto Project and I'm trying to 
setup Upstart as init manager. In my local.conf I have added these lines:

DISTRO_FEATURES_append = “ upstart”
VIRTUAL-RUNTIME_init_manager = “upstart”

but no recipe seems to exist. Am I wrong? I have searched through 
openembedded layers but I found only a recipe for WebOS distribution. Is 
it possible to use it with Yocto Dora or Yocto Daisy? There is another 
recipe?

thank you for the attention,
best regards,
Andrea


