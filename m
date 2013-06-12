Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 64CCC6AAA0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:04:51 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k14so70116oag.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Bq+lDfzOvs7VaNK2RRskQ+JGvGF7zB80EW3Nhl4md7Q=;
	b=X8PKcenuccEziv83T3ZCwh9IT5Zcaujo4bspzWmdhkHgFV5Ej2XqSNRE/k9zu7uH0r
	O8cfrsUJGegXZ7/vYkQkF/EjP+r7ZEm5Q1VV6Ub+5FvfdRevyrbNOm3TiVaIj86nRUVZ
	6i7shHCepUpMjjtfpvOmAydHnHtrVDdzlipfZXad14cTKD0zU+H3VotOIO0/yr7xXoL5
	1LqyRNgdy1jxnfg424cuSnPG7PZ26ABlqsl0wH2Y8arRzNNddika2Xyk6ZLF6J3uz3MI
	svb2r+GJKw+lE6sAqeyCie/jC+JMPIeTfgnlqiJOd9Xw8EdNkevyBxTK1U33MCtE9ndc
	NGJw==
MIME-Version: 1.0
X-Received: by 10.182.87.134 with SMTP id ay6mr15377300obb.13.1371042291903;
	Wed, 12 Jun 2013 06:04:51 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Wed, 12 Jun 2013 06:04:51 -0700 (PDT)
Date: Wed, 12 Jun 2013 06:04:51 -0700
Message-ID: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Possible to fetch from private github repo?
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
X-List-Received-Date: Wed, 12 Jun 2013 13:04:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have a client that keeps their app source code in a private github repository.

I haven't managed to find a way to convince the git fetcher to grab
the source code.

Has anyone else managed to write a recipe that uses a github private repository?

Thanks!

Steve

