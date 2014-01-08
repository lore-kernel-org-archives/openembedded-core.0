Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 365B26D1E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 23:20:32 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so2831172iec.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 15:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=BuyumDgxG1ESR9uTEI8ZP8p8Ag4uhGzIajxT8nbc/AE=;
	b=QbFT2Eu+PUKiTcD/744wFpusnEYumvgDSNG0L1xS4sUDwa93qQg5Uu1XTWdYWYB0mD
	Ud0+SF6rW9IApJ5Va7u9J6C3Gbd8ouhFL71sI4T+dP9CiPXXCLuBpz7DOFQHSgkY23Wj
	jhajQu+sveto+CGhdcH5Zc14wz//ua3LyvYfgPMEHsHlnwwkF7My1ji8SMts9jPz+XPw
	Cvw6bgkLKaFxzPONOr0I15yqiBjjNuxn97e/NtRcsjQslLVUyt14EfgDEWlDegN7RDRc
	Z5POgevPUv+KvAle8affi73HCUwX0aF8GTvrWDXy5fPyk0t4CI1MSC2jact+vsMap3RS
	saTA==
X-Gm-Message-State: ALoCoQlszua38hzKOmEf2HXLueYZ2y+0rcCHsBWcctbB4QerMx5dFUhHWYl7y3SBCiCdI3YgrFLZ
X-Received: by 10.42.239.77 with SMTP id kv13mr77245270icb.0.1389223233116;
	Wed, 08 Jan 2014 15:20:33 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id s4sm11421424ige.0.2014.01.08.15.20.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Jan 2014 15:20:32 -0800 (PST)
Message-ID: <52CDDD3E.7040508@linaro.org>
Date: Wed, 08 Jan 2014 18:20:30 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: bug scrub - RFC
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
X-List-Received-Date: Wed, 08 Jan 2014 23:20:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everyone,

This is a "Request For Comments" email regarding a "bug scrub" party the
OE TSC would like to hold.


background:
It has been noticed that the number of bugs in the bugzilla[1] has been
climbing; it would be nice to hold a "bug scrub" event to raise
awareness of the bugzilla and hopefully get some issues resolved.


questions:
1) Currently it has been suggested this should be a 2-day event, should
these two days be during the week or over a weekend? In either case,
which 2 days?

2) Since this is an OE event, should it focus only on OE bugs[2], or
should it be generalized for any bug?

3) Should we create a sign-up sheet (wiki) to keep track of who is
participating, and which issues are being looked at by whom?

(anything else?)


notes:
1) If you or the company for which you work uses OE/Yocto, please
consider making this a company event and having/allowing the engineers
(to) participate.

2) Even if you're not a recipe-, or a build-, or a python-wizard there
are still many things you can do to contribute. Being able to reproduce
a bug or reporting that a bug can't be reproduced can sometimes be quite
helpful (sometimes this points to a host issue or to a bug's description
not being descriptive enough). Sometimes a bug is stuck in the "needs
info" stage which maybe you can provide.

3) Can anyone think of way to help "get the word out"?

4) It would be cool to be able to provide incentives to help people get
interested and contributing to knocking some bugs around. So if anyone
(*cough* Intel) has any neat hardware (*cough* Galileo, Edison) they
could offer as an incentive (or, conversely, if there's a board you'd
like to see Yocto target) please see about making that happen.


Thanks and best regards,
    Trevor



[1] https://bugzilla.yoctoproject.org
[2]
https://bugzilla.yoctoproject.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ACCEPTED&bug_status=IN%20PROGRESS%20DESIGN&bug_status=IN%20PROGRESS%20DESIGN%20COMPLETE&bug_status=IN%20PROGRESS%20IMPLEMENTATION&bug_status=IN%20PROGRESS%20REVIEW&bug_status=REOPENED&bug_status=NEEDINFO&bug_status=WaitForUpstream&classification=Build%20System%20%26%20Metadata&list_id=156074&product=OE-Core&query_format=advanced&resolution=---&order=bug_id%20DESC&query_based_on=

