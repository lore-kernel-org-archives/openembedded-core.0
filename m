Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qenzw-00046C-DJ for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:48:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CW2P3027808
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:32:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27332-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 13:31:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CVmbV027802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 13:31:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <dba23bdca8e1eec8eae537bf563fd26e148614df.1309383978.git.josh@linux.intel.com>
References: <cover.1309383978.git.josh@linux.intel.com>
	<dba23bdca8e1eec8eae537bf563fd26e148614df.1309383978.git.josh@linux.intel.com>
Date: Thu, 07 Jul 2011 13:31:11 +0100
Message-ID: <1310041871.20015.821.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Thu, 07 Jul 2011 12:48:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 14:55 -0700, Joshua Lock wrote:
> Sanity test to verify files can be fetched from the network using git, http
> and https fetchers point users at a page to help get set up in the case of a
> failure.
> 
> Requires a variable CONNECTIVITY_CHECK_URIS to be set, using the same pattern
> as SRC_URI, of URI's to test against.
> The variable CONNECTIVITY_CHECK_MSG can be set to provide a custom error
> message, such as a pointer to some help, when this check fails.
> 
> Addresses [YOCTO #933]
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Merged to master, thanks.

Richard



