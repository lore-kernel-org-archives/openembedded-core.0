Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 957E17D209
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 21:55:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w18so246718wrv.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=OeMe5PU2sdk6JYaOIwW471MPViGmo35TYvqfu1P/JUk=;
	b=erx35EIIncZ+1GwIvr9BbU3o6fOoiUKtJNQcA5zcqekB3YdeDMyVGQ2UFkfkYx6vfr
	MMnppP7LvCCLBx+GKo9HdVKHmKtcwuKOcf7O7vHciGIh0qSHeOLnQJKo1zfnoGyJpJxK
	OAbHKYVwm4xvZYtxlVk8ZhxQPxlQy39NFOe6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=OeMe5PU2sdk6JYaOIwW471MPViGmo35TYvqfu1P/JUk=;
	b=S87/RV2Bbx4gXWK0GnMYIl1EBIMsGMC2/d5ALie5LpsZkF8FGLi4I34aEcR57fzXc6
	lG+D4x/4lfMbaL2Qmgw49F+sNx/xDupk1NdFihOZg9Yjz9sLTF5QbrYZwiC1yR5JpxJ5
	7K/imyhA0LF3gPRMg/F/0owvmUGZqOT5wJg5gzkFHnxgv8iadSJk/1BfQrkiNInG0EcC
	QlX/G93SgixAZ2v57x8TPiHa588/JLi4M+Et+5kvNITF4uaEZMU8PQtQbOGco1FrGxnm
	Gut+LI//X8qYGaZ3ecaMdcged5o3qa/44nKY+NurA3/PsDNpJR132szHH0gIS2YGnB+Y
	ZJIA==
X-Gm-Message-State: APjAAAUqfgLC36qEE62iiIzz0H7tpGY47AZ7IyRbInU2+MWvfXEt4ahr
	b8E4nCWZ4Yn6aEFRpR9LW9Cy8m325G4=
X-Google-Smtp-Source: APXvYqxULoy3/UcGEHPwlG9RBaTRKMBYPyDOl/PWJMNamIZe+r+XwFYtUyea5l8I8gKDRAyAlaoqoQ==
X-Received: by 2002:a5d:6889:: with SMTP id h9mr34803243wru.12.1555538153856; 
	Wed, 17 Apr 2019 14:55:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h2sm132814wro.11.2019.04.17.14.55.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Apr 2019 14:55:53 -0700 (PDT)
Message-ID: <6b07892b2df87ec0f9195109d5be39a02d74c04a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 22:55:51 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Recipes with ptest dependency problems
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
X-List-Received-Date: Wed, 17 Apr 2019 21:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I mentioned differences in numbers of pass/fail depending on which
image you install ptests into. The recipes which have the issues and
the numbers are:

core-image-sato with ptest installed:

Recipe                       | Passed      | Failed   | Skipped   | 

diffutils                    | 20          | 0        | 1         | 
elfutils                     | 31          | 6        | 166       | 
flex                         | 0           | 0        | 0         | 
gzip                         | 3           | 19       | 0         | 
libxml-parser-perl           | 0           | 15       | 0         | 
lttng-tools                  | 3397        | 626      | 1         | T
nettle                       | 95          | 2        | 2         | 
openssh                      | 0           | 0        | 1         | 
perl                         | 2425        | 20       | 235       | 
python                       | 304         | 6        | 39        | 
python3                      | 30321       | 2        | 1019      | 
quilt                        | 23          | 34       | 0         | 
tcl                          | 148         | 1        | 0         | 
util-linux                   | 378         | 2        | 58        | 
valgrind                     | 0           | 0        | 0         | 

core-image-sato-sdk with ptest installed:

Recipe                       | Passed      | Failed   | Skipped   | 

diffutils                    | 21          | 0        | 0         | 
elfutils                     | 31          | 4        | 168       | 
flex                         | 114         | 0        | 0         | 
gzip                         | 22          | 0        | 0         | 
libxml-parser-perl           | 15          | 0        | 0         | 
lttng-tools                  | 4693        | 1        | 412       | 
nettle                       | 96          | 1        | 2         | 
openssh                      | 67          | 0        | 3         | 
perl                         | 2430        | 19       | 231       | 
python                       | 131         | 1        | 17        | 
python3                      | 30329       | 2        | 1011      | 
quilt                        | 57          | 0        | 0         | 
tcl                          | 149         | 0        | 0         | 
util-linux                   | 473         | 2        | 52        | 
valgrind                     | 297         | 251      | 31        | 

I appreciate some of the numbers don't add up e.g. valgrind skips 0
tests? or the util-linux skip counts. I cropped the time taken counts
out as they confuse the diff other than to note the timeout/hang in
lttng-tools.

We probably need bugzilla entries for each one of these to look into
and fix the ptest package dependencies so the pass/fail counts are the
same in a core-image-sato to core-image-sato-sdk.

Cheers,

Richard


