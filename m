Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFDC6CEF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 20:53:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id b14so44061edt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=0ViIk1EQUG+LuSzdJoH+l9hx7oc2BrmjSiunfSNN8Xw=;
	b=HVm7DPCJXBzeR9rJb4PWo+MIxqeL94Ek6CqAiqRliHCb2D8f5E2MP+ys0/bcwmYX8S
	PKwr2CcndX6omogrgN+1WGaArFfLL/8WrVBVnWIgQvgI6gY0ywABCMWMj2+MjN8ctjHC
	iR9GCMLOZTqatT/Z9OrjBAgtSSZclZIiVTe01StNYZ1lSL0JQmYXH7Gx7X7aK+ue7utr
	yKJns8aaOUdqwmieRZE1ti623kEOlwkjFEX8aVc5LZTYsm7gPhf1mI5tnnMNBVKu7i8d
	fRgh0XXLvoRXZGzgd9hBV2rQR3ax4TtL6erJXd0TnuM8VyU7UHbzGH0zkuAI0OjXOxVA
	n77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=0ViIk1EQUG+LuSzdJoH+l9hx7oc2BrmjSiunfSNN8Xw=;
	b=Vb4Q+DBplw09mM+tMvWSN03T2RLqvGTZDPbzeIspiQu3rswyF7zQM4+PQM9P068NT1
	2rfAEoz7Tym2Y4Brl6FZnCbAvgcDwvQG2qw5MfHRzWGhd7M8/AOLroSzZ11LgQu1zenZ
	jzLxjRsueibpUbb7elbMGISrMr9TllrYhtKL5xjMxnRt4wTrZFg0O/e+kcNzgz8lvf5j
	Emks2Z3U5ghz001WCDnoCFicDiXvwqpGdNee4sfRqPnV8bZMzg5Zpau8o2HpKHpwduxF
	bpXMnkYfaRpH4iW2m6Dj1998UBGUQ2VUGPEANRCwhDbkDjYEsSn0hj9NTKWb6I3uC6tK
	nWgA==
X-Gm-Message-State: AA+aEWbZDUBCoHb7rrPSW/N8Ste3YwyZ/0hMVAfu25tl1PwYnoP8hU7U
	JdUaVOmVVieRzUievLAg8UA/Gk9t
X-Google-Smtp-Source: AFSGD/Xea0eMT2fcmNETStxcJ2MRZYlmInUsntIWn+eo7gCHiiRyrIuHskQGDy2EsVzWE20H9Lf35A==
X-Received: by 2002:a17:906:4003:: with SMTP id
	v3-v6mr8576605ejj.240.1543438426546; 
	Wed, 28 Nov 2018 12:53:46 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id u33sm8682edm.88.2018.11.28.12.53.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Nov 2018 12:53:45 -0800 (PST)
Message-ID: <2d0bf9425ea2150adb276bf1d77ac400c8ed4556.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 21:53:07 +0100
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Subject: Is python2 native broken in current eSDK?
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
X-List-Received-Date: Wed, 28 Nov 2018 20:53:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Having baked an eSDK. Now I'm facing a problem with devtool and python2 native.
The error occurs at least on the thud and on the master branch. Also the host distro seams not relevant. The same happens on Ubuntu 16.04, Ubuntu 18.04 and on Fedora 29 hosts.

For example modifying and building bzip2 ends up with an error message:
devtool build bzip2 
  NOTE: Starting bitbake server...
  ImportError: No module named site
  OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3.
  Please upgrade your python v2.


The failing lines of code are in the file: layers/poky/scripts/oe-buildenv-internal:
py_v27_check=$()
if [ "$py_v27_check" != "True" ]; then
    echo >&2 "OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3."
    echo >&2 "Please upgrade your python v2."
fi

The check for python2 fails because of a wierd PYTHONPATH environment variable exported by devtool/bitbake.


If I do something similar like bitbake does, the same error message is printed in another, clean shell:
$  >= (2,7,3)'
True
$ python2 -c 'import sys; print sys.version_info'
sys.version_info(major=2, minor=7, micro=15, releaselevel='final', serial=0)
$ export PYTHONHOME=/home/user/temp/poky_sdk/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/../../usr
$ python2 -c 'import sys; print sys.version_info >= (2,7,3)'
ImportError: No module named site


The processes spawned by devtool look like:
/home/user/temp/poky_sdk/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.5 /home/user/temp/poky_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/devtool build bzip2
  bash-c . /home/user/temp/poky_sdk/layers/poky/oe-init-build-env /home/user/temp/poky_sdk > /dev/null && script -e -q -c "bitbake bzip2:do_populate_sysroot bzip2:do_packagedata" /dev/null

The . /home/user/temp/poky_sdk/layers/poky/oe-init-build-env is where the PYTHONHOME variable comes in.

Any ideas? Have similar issues been seen else where?
Thanks,
Adrian


