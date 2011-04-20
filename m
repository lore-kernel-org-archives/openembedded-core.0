Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCTXj-0000rm-EV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 11:17:58 +0200
Received: by bwz5 with SMTP id 5so492438bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2011 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=gNR/s7xyDlTDIqcpn9/s+b/fuPZ4ffL9ua1UON+SjEY=;
	b=ZFPIoHoDfQL8tL3S2Bvz22hLwz30IR/Q/RT15N9K1LO2wwhXQ44I/hO4Sdf7mCqXr9
	iYTc/PUqofDAk6NlPOPt8Sran1ra19UYdx0DeythorFUihm9j5VBk6VkKv66l+6UFw2H
	2lgjto3pw4nzJdr+ihKKoSltV1yOZax0/quQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=dczHuzizmhJVQwwV5Wzj9DU2QEgIYZIMZ3li4I0iVVdRKgNPfly9QMOqjMSNf0tbJM
	H7KtdH9BgKuVEIQAoKlyopmTrY5GEiEeLlSdEiehE9wej1QcjJz+tK8dIbMuQFY20EJ2
	Rdw8Wgw9GKKP6T2uEoHHkeji3tFzTZV7oKnDY=
Received: by 10.204.188.65 with SMTP id cz1mr2878412bkb.108.1303290924528;
	Wed, 20 Apr 2011 02:15:24 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y9sm863668faj.0.2011.04.20.02.15.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 02:15:23 -0700 (PDT)
Date: Wed, 20 Apr 2011 11:15:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110420091523.GH5675@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Mailman refusing multipart/signed Content-Type
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
X-List-Received-Date: Wed, 20 Apr 2011 09:17:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, 

mailman always refuse gpg signed e-mails from me when I forgot to
disable default sign.

Complete header is:
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

Mailman message is:
The message's content type was not explicitly allowed

Other LTG lists don't have problem with this, is it intentional or could
someone fix oe-core ML configuration?

Thanks

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


