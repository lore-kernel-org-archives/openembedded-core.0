Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9449B607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:46:41 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o5so137733295iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=idJuoVUKWwRfMTB2bn1D6eqv7A1tn/02qohfGgqFGYs=;
	b=TfWeD5dzXnNusmdTTKmiD8l49uLg8xcNKeQZkVjcTfNpYCHUYbjalgKcOaLLxtH6UR
	p9Aj6Q+kHi0wV/DJvBy1dNxsPyBEvNcRvR3waY6mza9eGKdRfHM9DsENaTwZ5e2Svhuh
	75S8ynzkynSLUlg0xEZ8HudAy4k4N2LUDMFtf8Pju6egyU7Fu1n8OQPKb4n4biXGbcfS
	1WAclWyFklYaeNILq/F57HPF1pyUsZlCsv3q7g09WHKeEsVzveRpCWn8De+ODV3xTCjR
	lTT7e+63RpIlTScvDpboelnJFUrqJGSUktGmFpEyJM/yPf8dOIE5ctLACMeNRkLd3ZZm
	97Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=idJuoVUKWwRfMTB2bn1D6eqv7A1tn/02qohfGgqFGYs=;
	b=BiplM9D3/MaXryAlpkOsdVn0WGS59jUQgT/wpIE290R1iT9ee8h/dDieivqjaoDaVZ
	DZLwC2iUunXKWoe4HFfa+7FXejLKjOSWbmJjP6jNgeZ9pnOT0jAYBIlAIfFznAxQt5U/
	JkFjT7L7lMasDR+i/6E3+2x5wiD/sS5da4dALzr4yWHI7xbtHXgoLu9O5t48u88oXUP5
	uE1VeMwd45IHNNlUEcyFWL0DZ9nFZVBEEqd3NU0xwQ4M7vr6C52C+q56IFVXGjUqPaQO
	5DaXwWRxVapeNF1bzx0Q7pozqcIovMAskkw05I9RmW+rdJjBhD4HR1LlO8dp82EUn/hE
	77cg==
X-Gm-Message-State: AD7BkJKIzs2zFU/wbo77Z5Jpq9U9xPgadO4sWObTJBWTt8aVFRWqorrW3kx5JjWshnn7Ngshcp/kyP6VVU14fw==
MIME-Version: 1.0
X-Received: by 10.107.63.139 with SMTP id m133mr28019158ioa.157.1458589110960; 
	Mon, 21 Mar 2016 12:38:30 -0700 (PDT)
Received: by 10.64.26.227 with HTTP; Mon, 21 Mar 2016 12:38:30 -0700 (PDT)
Date: Mon, 21 Mar 2016 15:38:30 -0400
Message-ID: <CAMZfsd4G5iyKkEjaaR+T9_xTiSw=BKdB+rParnk7fwnq6uUvYQ@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-qt5] QtCreator now allowing me to select qmake in SDK
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
X-List-Received-Date: Mon, 21 Mar 2016 19:46:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c061552d57e65052e943d57

--94eb2c061552d57e65052e943d57
Content-Type: text/plain; charset=UTF-8

Hello,

I have used bitbake core-image-minimal -c populate_sdk to build an SDK for
the Minnowboard to be used by QtCreator. After doing so, the SDK was built
in /opt/poky/2.0.1/sysroots...

1. Within /sysroots I have corei7-64-poky-linux and x86_64-pokysdk-linux
directories. My first question is which directory do I use when pointing to
my compiler, debugger and QtVersion (qmake) for QtCreator?

2. Secondly, when I try pointing to the qmake in
/opt/poky/2.0.1/sysroots/corei7-64-poky-linux/usr/bin/qt, QtCreator says
that the file does not exist. I have tried everything to add it but it just
wont work. I then thought I had to point to the one in x86_64-pokysdk-linux,
however there is no qmake there. Any ideas on what the problem may be?

Thanks!

--94eb2c061552d57e65052e943d57
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div><div><div><div>Hello,<br><br></div>I have used <span>bitbake 
core-image-minimal -c populate_sdk to build an SDK for the Minnowboard 
to be used by QtCreator. After doing so, the SDK was built in 
/opt/poky/2.0.1/sysroots...<br><br></span></div><span>1. Within 
/sysroots I have corei7-64-poky-linux and x86_64-pokysdk-linux 
directories. My first question is which directory do I use when pointing
 to my compiler, debugger and QtVersion (qmake) for QtCreator?<br><br></span></div><span>2.
 Secondly, when I try pointing to the qmake in 
/opt/poky/2.0.1/sysroots/corei7-64-poky-linux/usr/bin/qt, QtCreator says
 that the file does not exist. I have tried everything to add it but it 
just wont work. I then thought I had to point to the one in </span><span>x86_64-pokysdk-linux, however there is no qmake there. </span><span>Any ideas on what the problem may be?</span><br><br></div>Thanks!</div>

--94eb2c061552d57e65052e943d57--
