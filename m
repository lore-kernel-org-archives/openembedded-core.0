Return-Path: <anton@advancedtelematic.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 034DC71A37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 22:32:00 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g10so71418279wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 15:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=DVdRXaD0MGPva9vQlvYYFmUEs+lE0Oh3/J+IQ95YU2w=;
	b=u7Hy8CRbD1pLjlqjG6yhmw16o401vvBtx+c8aJNIIWjG1ZGhKSjfE67nrWnO2GSaWz
	8WWBC2KVINDbTIFq/LIMAYHF1BcAei8dRH5IQDAdqByPUMco4/fBOKNpbIHz8u5iWgqW
	ICtXJzVzyx3Iuum6Wq0lUfEw5DViJ6vbntioY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=DVdRXaD0MGPva9vQlvYYFmUEs+lE0Oh3/J+IQ95YU2w=;
	b=k3kKE7Wb0iE7/Z13yYAHRbuQwF+k+GAYqH+xyJEHaakn8fURJihHHeO2RKrvc5PZE0
	460znEOs2NUIxhfakGwglLNoKG9KFRppFJuopO0qjHrEZ03kzXIwPkF7fXPwNe1A4iU6
	H80Ca/plgmZBTLbZL037qv86QZoyFauuMdtrd6u0fLjPlEDV1JejqMdEEYVwIY6LDHEa
	ckKmKhjc2ZOGds8FWSkckNDd/Llh5VwZrKNqaTgSAzbH3uQa4OqDvjNdv2GUwtPpMQ8g
	49H19TBTTfLWgVlGMx9jk5q4CvB7C9HBUM2DqWH45N0Op2D/c+iXUUrrQuIpr+d4vCGh
	LKSg==
X-Gm-Message-State: AFeK/H1WfqAn0HbuouHr+p6d1NlqtE3Jguvo3asuTp6An+Aa6iIZhMSjBm2a56npre73AA==
X-Received: by 10.223.148.230 with SMTP id 93mr20412343wrr.111.1489876321610; 
	Sat, 18 Mar 2017 15:32:01 -0700 (PDT)
Received: from [192.168.1.134] (x4db3191e.dyn.telefonica.de. [77.179.25.30])
	by smtp.gmail.com with ESMTPSA id
	j34sm14886273wre.7.2017.03.18.15.32.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Mar 2017 15:32:01 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: Anton Gerasimov <anton@advancedtelematic.com>
Message-ID: <b89d6532-f5d0-5ac2-f706-7dc8cf4fe578@advancedtelematic.com>
Date: Sat, 18 Mar 2017 23:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
Subject: Status of usrmerge merger
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
X-List-Received-Date: Sat, 18 Mar 2017 22:32:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

what is the current status of the usrmerge patch [1]? It was submitted
quite a long time ago and I can't find any discussion about it. If there
is something I can do to help with testing/tweaking to get it merged
please let me know.

Thanks,
Anton Gerasimov

[1] https://patchwork.openembedded.org/patch/136986/


--=20
Anton Gerasimov, ATS Advanced Telematic Systems GmbH
Kantstrasse 162, 10623 Berlin
Managing Directors: Dirk P=C3=B6schl, Armin G. Schmidt
Register Court: HRB 151501 B, Amtsgericht Charlottenburg



