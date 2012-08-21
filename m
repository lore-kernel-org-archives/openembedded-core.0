Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T3kGL-0008VC-B0
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 10:56:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 01:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,801,1336374000"; 
	d="scan'208,217";a="207279301"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2012 01:44:31 -0700
Message-ID: <50334AFC.8080502@intel.com>
Date: Tue, 21 Aug 2012 11:46:52 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1345208727-3029-1-git-send-email-radu.moisan@intel.com>
	<502E696C.8050304@linux.intel.com> <5031D36D.7040107@intel.com>
	<503269BC.1000106@linux.intel.com>
In-Reply-To: <503269BC.1000106@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] coreutils: Upgrade to upstream version 8.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 08:56:37 -0000
Content-Type: multipart/alternative;
	boundary="------------000408040601080205070107"

--------------000408040601080205070107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


>>> Your new patch needs a header, explaining why, and adding
>>> Upstream-Status and Signed-off-by tags.
>>>
>> I meant this only as an RFC, to get feedback for my patch, from a
>> functional point of view, it is not intended to be the final patch.
>> I have a Signed-off-by tag, are you referring to something else?
>> Can you give me more details about Upstream-Status? I've google'd this
>> problem for a bit but could not find an existing patch for it, nor a bug
>> filled for this matter. Since I don't know yet if what I'm fixing it's
>> really a bug (or a misconfiguration on my side) I send this RFC to get a
>> hold of whether I'm on the good track here or not. If this patch turns
>> out to be valid, I'll get in touch with the guys from coreutils' mailing
>> lists, and try to push it upstream.
>
> Radu,
>
> For patches included in a given recipe we also have Signed-off-by as 
> well as the Upstream-Status tag as defined by:
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Please review this again.
Soul,
I understood your point, and in the *actual* patch I will update the 
Sign-off-by and a short description, and an Upstream Status. However, I 
reviewed again  Commit_Patch_Message_Guidelines and there is nothing in 
there mentioned about RFCs. This is an RFC, and it was intended to get a 
quick feedback from people more familiar/experienced with 
coreutils/autotools. I need feedback about the functional change of this 
patch. In my first reply I described as extensively as I could my 
problem and my question.

As far as the RFCs go, how long should I wait on an RFC? It's been more 
then a few days and nobody commented. Would it be appropriate to assume 
that if nobody had any comments, the patch is valid?

Radu

--------------000408040601080205070107
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <blockquote cite="mid:503269BC.1000106@linux.intel.com" type="cite">
      <blockquote type="cite">
        <blockquote type="cite">Your new patch needs a header,
          explaining why, and adding
          <br>
          Upstream-Status and Signed-off-by tags.
          <br>
          <br>
        </blockquote>
        I meant this only as an RFC, to get feedback for my patch, from
        a
        <br>
        functional point of view, it is not intended to be the final
        patch.
        <br>
        I have a Signed-off-by tag, are you referring to something else?
        <br>
        Can you give me more details about Upstream-Status? I've
        google'd this
        <br>
        problem for a bit but could not find an existing patch for it,
        nor a bug
        <br>
        filled for this matter. Since I don't know yet if what I'm
        fixing it's
        <br>
        really a bug (or a misconfiguration on my side) I send this RFC
        to get a
        <br>
        hold of whether I'm on the good track here or not. If this patch
        turns
        <br>
        out to be valid, I'll get in touch with the guys from coreutils'
        mailing
        <br>
        lists, and try to push it upstream.
        <br>
      </blockquote>
      <br>
      Radu,
      <br>
      <br>
      For patches included in a given recipe we also have Signed-off-by
      as well as the Upstream-Status tag as defined by:
      <br>
      <br>
      <a class="moz-txt-link-freetext" href="http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines">http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a>
      <br>
      <br>
      Please review this again.
      <br>
    </blockquote>
    Soul,<br>
    I understood your point, and in the <b>actual</b> patch I will
    update the Sign-off-by and a short description, and an Upstream
    Status. However, I reviewed again&nbsp; Commit_Patch_Message_Guidelines
    and there is nothing in there mentioned about RFCs. This is an RFC,
    and it was intended to get a quick feedback from people more
    familiar/experienced with coreutils/autotools. I need feedback about
    the functional change of this patch. In my first reply I described
    as extensively as I could my problem and my question. <br>
    <br>
    As far as the RFCs go, how long should I wait on an RFC? It's been
    more then a few days and nobody commented. Would it be appropriate
    to assume that if nobody had any comments, the patch is valid?<br>
    <br>
    Radu<br>
  </body>
</html>

--------------000408040601080205070107--
