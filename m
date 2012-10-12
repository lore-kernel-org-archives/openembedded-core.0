Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdZv-0004ms-Px
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:38:56 +0200
Received: from localhost ([127.0.0.1]:51926 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdNA-0006MV-9j
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 11:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=gty1nrR3F+g3n0HoaCeMXG
	5Z5S8=; b=gW0nBeBIXJqwPDLbSh+QElnexWpS495GjmuhyFQMhsqTWFRilc/Qct
	8RMkWno3t+jON8XzX0ZtlVkBZR32L6i4fTfaTJPJ1e8JUIwkA9IN3tgWUswqZpPE
	skRuNNeqb6zNlY3e/fEjyMJclonTQQ2V8FnDfjdyBV9g71fhyUiYM=
Received: from [195.171.99.130] (port=39464 helo=[192.168.0.79])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdNA-0006MS-7R
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 11:25:44 +0000
Message-ID: <5077FEA8.5080308@communistcode.co.uk>
Date: Fri, 12 Oct 2012 12:27:36 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Build Failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 11:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On my git pull and build today I ran into some compile errors. As 
mentioned before I would usually just -c cleansstate and retry, which 
99% of the time sorts the issue. However, I was informed this was not 
meant to happen and logs would be appreciated, so please find them below.

pkgconfig-native
http://ix.io/38G

binutils-crosssdk
http://ix.io/38I

Possibly looks like something doesn't have a 'sed' dependency when it 
should?

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



