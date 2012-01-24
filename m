Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RpgZK-0006Am-DH
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 14:37:50 +0100
Received: by wgbdt11 with SMTP id dt11so3690960wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SQ52xxUfj0LgbfKKz09W+CLauDgrZUC0GBJg760a17M=;
	b=YZUi5YFeu/EhsOFOa8qj8EfpTWcNTr+p69NNc2PJwHDHc5EXZQNokInG2r1w7Uiatf
	6a5kRkJpOvYY2XwoMWlJ2aiiB81k5iEgf3vC2kvO50xtuS1/R2IQMgLf8EZbcxWt/kj/
	csL9/scSgUUBf9uHFRt4fcZVmfJc6weRb7W5c=
MIME-Version: 1.0
Received: by 10.180.95.199 with SMTP id dm7mr20764276wib.9.1327411805130; Tue,
	24 Jan 2012 05:30:05 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Tue, 24 Jan 2012 05:30:05 -0800 (PST)
Date: Tue, 24 Jan 2012 14:30:05 +0100
Message-ID: <CAGiJk9dnE5PNX68AO8gXH+VseMS4LFG=1Bq+cQMekSgrVo1aXw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: CMake error? CMAKE_AR-NOTFOUND
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 13:37:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
currently I try to build a native software that needs CMake, it is a
required tool to cross compile another software.
An it seems that CMAKE_AR is set to an invalid value (CMAKE_AR-NOTFOUND).
The cmake.bbclass has no entry about this.

By searching the web, the only information found was that it can be
set to ${GCC_PATH}/dld.
As I am usually not working with CMake where can I find the native
"ar" or "dld" executable in OpenEmbedded?

Using the archiver from my hosts /usr/bin/ar seems to be wrong since
in cmake.bbclass "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )"
prohibits it.

Sorry for this stupid question.

-- 
Regards
Samuel


