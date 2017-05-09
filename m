Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 2333F6FF69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 22:27:08 +0000 (UTC)
Received: (qmail 1838 invoked by uid 1003); 9 May 2017 22:27:09 -0000
Received: from unknown (HELO ?10.50.10.213?) (philip@opensdr.com@69.7.123.146)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 May 2017 22:27:09 -0000
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
	<cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
	<9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <f6488f5e-2b4d-eb51-3ca1-02db36780e0a@balister.org>
Date: Tue, 9 May 2017 16:27:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 22:27:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/09/2017 03:03 PM, Paul Eggleton wrote:
> On Wednesday, 10 May 2017 8:39:58 AM NZST Alexander Kanavin wrote:
>> On 05/09/2017 11:19 PM, Khem Raj wrote:
>>> I think we should always intend to align the reference stack with
>>> whats commonly used in
>>> userbases we target to address with project, we will not be serving
>>> the project goals and its username if we
>>> trim down to packages which are just used for reference, if majority of
>>> the community we intend to address uses QT or any other stack for that
>>> matter then we should align our requirements accordingly which will be
>>> mutually beneficial IMO
>>
>> I strongly disagree. Oe-core is not a Greatest Embedded Hits collection 
>> or any kind of 'reference stack', and decisions on what goes into it 
>> should not be based on how popular it is. 
> 
> A number of things have been added to OE-Core because they are widely used, so 
> I don't think that's true. However, that doesn't mean that would be used as a 
> justification to add Qt5. I'm not even convinced we would need to add Qt5 to 
> OE-Core in order to use it as part of a reference UI - the key requirement 
> would be for us to commit to being part of its testing and maintenance, 
> everything else is just logistics.
> 
>> If you do this, you risk overextending the layer, and ending up not doing a
>> particularly good job on any of the things it tries to do. It's best to
>> allow other layers to  flourish, let the domain specialists do their job and
>> decide for themselves how they want to do things, and have a curated list of
>> layers that are known to be high quality and approved by Yocto Project.
>>
>> If you want qt5, use meta-qt5 and meta-b2qt, both made by people who 
>> actually develop the Qt stack itself. End of story.
> 
> Your opinion is noted. My opinion is that we ought to be providing a good 
> reference that can be used as a basis for real products (regardless of whether 
> whatever direction we choose to go is Qt-based or not) - the rest of our stack 
> *is* used that way, after all. We regularly get comments about how Sato isn't 
> suitable as such a basis, so the expectation is there. I don't think adding 
> Wayland support alone will answer that.

Does anyone currently ship a real product based on sato?

Yes, I am aware that sato works for testing gui stuff, just trying to
understand if it is used beyond that.

Philip

> 
> Cheers,
> Paul
> 

